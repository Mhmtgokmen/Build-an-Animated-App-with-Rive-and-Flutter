import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'list_for_combo_filter_model.g.dart';

@JsonSerializable()
class ListForComboFilterModel {
  String? search;
  int? id;

  ListForComboFilterModel({
    this.search,
    this.id,
  });

  factory ListForComboFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ListForComboFilterModelFromJson(json);

  Map<String, dynamic> toJson(JsonCodec json) => _$ListForComboFilterModelToJson(this);
}
