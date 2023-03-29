import 'dart:convert';

import 'package:rive_animation/constants/api_constants.dart';
import 'package:rive_animation/model/item_for_combo_model.dart';
import 'package:rive_animation/model/list_for_combo_filter_model.dart';
import 'package:rive_animation/shared/return_info.dart';
import 'package:http/http.dart' as http;
import 'package:rive_animation/shared/session_manager.dart';

class EmployeeService {
  static final _headers = {'Content-Type': 'application/json'};
  static const String service = '/Employee';

  Future<ReturnInfo> getListForCombo(ListForComboFilterModel comboFilter) async {
    try {
      String body = json.encode(comboFilter.toJson(const JsonCodec()));
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.apiUrl}$service/GetListForCombo?session=${SessionManager.ui.sessionId}&allData=true"),
        headers: _headers,
        body: body,
      );

      if (response.statusCode == 200) {
        String responseBody = response.body;
        var responseData = ReturnInfo.fromJson(
          json.decode(responseBody),
          (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) =>
                      ItemForComboModel.fromJson(e as Map<String, dynamic>))
                  .toList()
              : null,
        );
        return responseData;
      }else {
        throw Exception('Faild to get data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
