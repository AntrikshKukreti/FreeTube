import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/Controllers.dart';
import '../../Constants/constant.dart';
import '../Model/searchResponseModel.dart';

final constant = Constants();
final controllers = TextFieldController();

class SearchData {
  static var client = http.Client();
  Future<dynamic> getSearchData(String val) async {
    var result;
    final uri = Uri.https('www.googleapis.com', '/youtube/v3/search', {
      'key': constant.apiKey,
      'part': 'snippet',
      'maxResults': '50',
      'regionCode': 'IN',
      'type':'channel,playlist,video',
      'videoDefinition':'any',
      'videoDimension':'any',
      'viedeoType':'any',
      'q':val
    });
    var response = await client.get(
      Uri.parse(Uri.decodeFull(uri.toString())),
    );

    if (response.statusCode == 200) {
      result = SearchResponse.fromJson(jsonDecode(response.body));
    }
    else {
      result = false;
    }
    return result;
  }
}