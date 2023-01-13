// ignore_for_file: file_names

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:techinical/api/component/customWidget.dart';

class ErrorResponse {
  ErrorResponse({
    required this.errorCode,
    required this.message,
  });

  int errorCode;
  String message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        errorCode: json["errorCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "message": message,
      };
  factory ErrorResponse.onError(int errorCode, String message) {
    ErrorResponse? error;
    CustomWidget.showDialog("Error $errorCode", message);
    error = ErrorResponse(
      errorCode: 500,
      message: message,
    );

    return error;
  }
}

ErrorResponse validationError(DioError e) {
  inspect(e);
  var error = ErrorResponse(errorCode: 500, message: "");
  // ignore: unnecessary_null_comparison
  if (e.response == null) {
    error.errorCode = 500;
    error.message = e.toString();
  } else {
    error.errorCode = e.response!.statusCode!;
    error.message = e.response!.statusMessage!;
  }
  inspect(error);
  CustomWidget.showDialog("Error ${error.errorCode}", error.message);
  return error;
}
