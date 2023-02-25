import 'package:json_annotation/json_annotation.dart';
import 'package:rive_animation/model/sub_menu_item_model.dart';

part 'user_menu_info_model.g.dart';

@JsonSerializable()
class UserMenuInfoModel {
  String menuName;
  String menuIcon;
  String state;
  int bedgeValue;
  String translateName;
  List<SubMenuItemModel> subMenuItems;

  UserMenuInfoModel({
    required this.menuName,
    required this.menuIcon,
    required this.state,
    required this.bedgeValue,
    required this.translateName,
    required this.subMenuItems,
  });

  factory UserMenuInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserMenuInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserMenuInfoModelToJson(this);
}
