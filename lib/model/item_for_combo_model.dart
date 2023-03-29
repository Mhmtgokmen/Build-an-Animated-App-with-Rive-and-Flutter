import 'package:json_annotation/json_annotation.dart';

part 'item_for_combo_model.g.dart';

@JsonSerializable()
class ItemForComboModel {
  String displayText;
  int value;
  String freeText;

  ItemForComboModel({
    required this.displayText,
    required this.value,
    required this.freeText,
  });

  factory ItemForComboModel.fromJson(Map<String, dynamic> json) =>
      _$ItemForComboModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemForComboModelToJson(this);
}
