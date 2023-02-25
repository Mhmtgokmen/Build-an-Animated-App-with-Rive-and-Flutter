import 'package:json_annotation/json_annotation.dart';

part 'column_info_model.g.dart';

@JsonSerializable()
class ColumnInfoModel {
  String prop;
  String localText;

  ColumnInfoModel({
    required this.prop,
    required this.localText,
  });

  factory ColumnInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ColumnInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnInfoModelToJson(this);
}
