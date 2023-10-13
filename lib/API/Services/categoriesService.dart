import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/constant.dart';
import '../Model/categoriesResponseModel.dart';

final constant = Constants();

class GetVideoCategories {
  static var client = http.Client();
  Future<dynamic> getCategoriesData() async {
    var result;
    final uri = Uri.https('www.googleapis.com', '/youtube/v3/videoCategories', {
      'key': constant.apiKey,
      'part': 'snippet',
      'regionCode': 'IN',
    });
    var response = await client.get(
      Uri.parse(Uri.decodeFull(uri.toString())),
    );

    if (response.statusCode == 200) {
      result = CategoriesResponse.fromJson(jsonDecode(response.body));
    }
    else {
      result = false;
    }
    return result;
  }
}