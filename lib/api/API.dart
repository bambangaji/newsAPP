// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static String get_top_headlines = dotenv.env['GET_TOP_HEADLINES'].toString();
  static String get_all_article = dotenv.env['GET_ALL_ARTICLE'].toString();
}
