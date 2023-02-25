import 'package:json_annotation/json_annotation.dart';
import 'package:rive_animation/model/pager_model.dart';

part 'query_info_model.g.dart';

@JsonSerializable()
class QueryInfoModel {
  String orderby;
  List<PagerModel> pager;

  QueryInfoModel({
    required this.orderby,
    required this.pager,
  });

  factory QueryInfoModel.fromJson(Map<String, dynamic> json) =>
      _$QueryInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$QueryInfoModelToJson(this);
}
