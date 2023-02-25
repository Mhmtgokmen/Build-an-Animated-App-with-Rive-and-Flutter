import 'dart:convert';

import 'package:rive_animation/constants/api_constants.dart';
import 'package:rive_animation/shared/return_info.dart';
import 'package:http/http.dart' as http;
import 'package:rive_animation/shared/user_info.dart';

class LoadingService{
  static final _headers = {'Content-Type': 'application/json'};
  static const String service = '/Loading';

  Future<ReturnInfo> getLoadingList(String session) async {
    try{
      String body = json.encode({"session":session});
            final response = await http.post(
        Uri.parse("${ApiConstants.apiUrl}$service/GetLoadingList?session=$session"),
        headers: _headers,
        body: body,
      );

      if (response.statusCode == 200) {
        String responseBody = response.body;
        var responseData = ReturnInfo.fromJson(
          json.decode(responseBody),
          (data) => data != null
              ? UserInfo.fromJson(data as Map<String, dynamic>)
              : null,
        );
        return responseData;
      } else {
        throw Exception('Faild to get data');
      }
    }catch (e) {
      throw Exception(e);
    }
  }
}