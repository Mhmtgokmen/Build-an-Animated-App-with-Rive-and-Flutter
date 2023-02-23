import 'dart:convert';

import 'package:rive_animation/constants/api_constants.dart';
import 'package:rive_animation/shared/return_info.dart';
import 'package:http/http.dart' as http;
import 'package:rive_animation/shared/user_info.dart';

class LoginService {
  static final _headers = {'Content-Type': 'application/json'};
  static const String service = '/Login';

  Future<ReturnInfo> authenticate(String userName, String password) async {
    try {
      String body = json.encode({"userName": userName, "password": password});
      final response = await http.post(
        Uri.parse("${ApiConstants.apiUrl}$service/Authenticate"),
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
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ReturnInfo> getUserMenuInfo(String sessionId) async {
    try {
      String body = json.encode({"session": sessionId});
      final response = await http.post(
        Uri.parse("${ApiConstants.apiUrl}$service/GetUserMenuInfo"),
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
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ReturnInfo> getAuthenticatedUser(String sessionId) async {
    try {
      final response = await http.get(
        Uri.parse(
            "${ApiConstants.apiUrl}$service/GetAuthenticatedUser?session=$sessionId"),
        headers: _headers,
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
        throw Exception('Failed to get data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
