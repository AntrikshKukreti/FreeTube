import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/constant.dart';
import '../Model/videoResponseModel.dart';

final constant = Constants();

class GetVideos {
  static var client = http.Client();
  Future<dynamic> getVideoData() async {
    var result;
    final uri = Uri.https('www.googleapis.com', '/youtube/v3/videos', {
      'access_token': constant.accessToken,
      'key': constant.apiKey,
      'chart': 'mostPopular',
      'part': 'snippet',
      'maxResults': '50',
      'regionCode': 'IN',
    });
    var response = await client.get(
      Uri.parse(Uri.decodeFull(uri.toString())),
    );

    if (response.statusCode == 200) {
      result = VideosResponse.fromJson(jsonDecode(response.body));
    }
    else {
      result = false;
    }
    return result;
  }
}