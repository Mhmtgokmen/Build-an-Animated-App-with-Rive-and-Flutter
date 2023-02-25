import 'package:json_annotation/json_annotation.dart';
import 'package:rive_animation/model/column_info_model.dart';
import 'package:rive_animation/model/query_info_model.dart';

part 'filter_model.g.dart';

@JsonSerializable(
    genericArgumentFactories: true, fieldRename: FieldRename.snake)
class FilterModel<T> {
  @JsonKey(name: 'filter')
  T? filter;
  @JsonKey(name: 'queryInfo')
  List<QueryInfoModel> queryInfo;
  @JsonKey(name: 'isExport')
  bool isExport;
  @JsonKey(name: 'columnInfos')
  List<ColumnInfoModel>? columnInfos;

  FilterModel({
    required this.filter,
    required this.queryInfo,
    required this.isExport,
    required this.columnInfos,
  });

  factory FilterModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$FilterModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$FilterModelToJson(this, toJsonT);
}
