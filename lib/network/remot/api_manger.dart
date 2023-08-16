import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_task/models/newsResponse.dart';

import '../../models/sourcesResponce.dart';
import '../constant.dart';
class ApiManger {

  static Future<SourcesResponce> getSources() async {
    Uri url = Uri.https(BASE_URL, END_POINT, {"apiKey": ApiKey});
    Response response = await http.get(url); //string
    var jsonresponse = jsonDecode(response.body); //map
    SourcesResponce sourcesResponce = SourcesResponce.fromJson(
        jsonresponse); //object
    return sourcesResponce;
  }

  static Future<NewsResponse> getNews(String sourseId) async {
    Uri url = Uri.https(
        BASE_URL, endpoint, {"apiKey": ApiKey, "sources": sourseId});
    Response response = await http.get(url); //string
    var jsonResponse = jsonDecode(response.body); //json
    NewsResponse newsResponse=NewsResponse.fromJson(jsonResponse);
    return newsResponse;


  }
}
