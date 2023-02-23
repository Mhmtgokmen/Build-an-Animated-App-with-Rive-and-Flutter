import 'package:json_annotation/json_annotation.dart';

part 'sub_menu_item_model.g.dart';

@JsonSerializable()
class SubMenuItemModel {
  String menuName;
  String status;
  String translateName;

  SubMenuItemModel({
    required this.menuName,
    required this.status,
    required this.translateName,
  });

  factory SubMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$SubMenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubMenuItemModelToJson(this);
}
