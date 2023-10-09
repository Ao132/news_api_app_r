
import 'dart:convert';

import 'package:news_app_r/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_r/model/news_response.dart';
import 'package:news_app_r/model/source_response.dart';

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {'apiKey': 'c4da88a2e5b241ab96c5ba23faa2b66e'});
    try {
      var response = await http.get(url);
      String bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {'apiKey': 'c4da88a2e5b241ab96c5ba23faa2b66e', 'sources': sourceId});
    try {
      var response = await http.get(url);
      String bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
