// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore
import 'package:dio/dio.dart';
import 'package:techinical/api/Error.dart';
import 'package:techinical/model/news_model.dart';
import 'package:techinical/service/fetch.dart';

import 'API.dart';

Future<NewsApi> getListNews(
    String country, String category, String page) async {
  try {
    var URL =
        "${API.get_top_headlines}?country=$country&category=$category&pageSize=10&page=$page";
    final Response response = await fetch().get(URL);
    return NewsApi.fromJson(response.data);
  } on DioError catch (e) {
    validationError(e);
    return NewsApi.dataError();
  }
}
