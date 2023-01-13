import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:techinical/model/news_model.dart';
import 'package:techinical/service/fetch.dart';

const successMessage = {'message': 'Success'};

void main() async {
  String fileName = '.env-develop';
  await dotenv.load(fileName: fileName);
  late String baseUrl;

  group('- Get Method', () {
    setUp(() {
      baseUrl = "https://newsapi.org/v2/top-headlines?country=";
    });
    test('Test endpoint returns 200 without data', () async {
      var data = NewsApi.dataError();
      try {
        var response = await fetch().get("${baseUrl}abxddd");
        data = NewsApi.fromJson(response.data);
      } on DioError catch (e) {
        data = NewsApi.dataError();
      }
      expect(data.articles, []);
    });

    test('Test endpoint returns 200 with data', () async {
      var data = NewsApi.dataError();
      try {
        var response = await fetch().get("${baseUrl}id");
        data = NewsApi.fromJson(response.data);
      } on DioError catch (e) {
        data = NewsApi.dataError();
      }
      expect(true, data.totalResults > 0);
    });
  });
}
