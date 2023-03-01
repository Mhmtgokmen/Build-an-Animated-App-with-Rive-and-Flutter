import 'dart:convert';

import 'package:rive_animation/constants/api_constants.dart';
import 'package:rive_animation/model/column_info_model.dart';
import 'package:rive_animation/model/filter_model.dart';
import 'package:rive_animation/model/loading_filter_model.dart';
import 'package:rive_animation/model/loading_model.dart';
import 'package:rive_animation/model/query_info_model.dart';
import 'package:rive_animation/shared/return_info.dart';
import 'package:http/http.dart' as http;
import 'package:rive_animation/shared/session_manager.dart';

class LoadingService {
  static final _headers = {'Content-Type': 'application/json'};
  static const String service = '/Loading';

  Future<ReturnInfo> getLoadingList(
      FilterModel<LoadingFilterModel> filter) async {
    try {
      String body = json.encode({
        'filter': filter.filter,
        'columnInfos': filter.columnInfos,
        'isExport': filter.isExport,
        'queryInfo': filter.queryInfo
      });
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.apiUrl}$service/GetLoadingList?session=${SessionManager.getSessionId()}"),
        headers: _headers,
        body: body,
      );

      if (response.statusCode == 200) {
        String responseBody = response.body;
        var responseData = ReturnInfo.fromJson(
          json.decode(responseBody),
          (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => LoadingModel.fromJson(e as Map<String, dynamic>))
                  .toList()
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
}
