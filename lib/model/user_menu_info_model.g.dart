// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_menu_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMenuInfoModel _$UserMenuInfoModelFromJson(Map<String, dynamic> json) =>
    UserMenuInfoModel(
      menuName: json['menuName'] as String,
      menuIcon: json['menuIcon'] as String,
      state: json['state'] as String,
      bedgeValue: json['bedgeValue'] as int,
      translateName: json['translateName'] as String,
      subMenuItems: (json['subMenuItems'] as List<dynamic>)
          .map((e) => SubMenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserMenuInfoModelToJson(UserMenuInfoModel instance) =>
    <String, dynamic>{
      'menuName': instance.menuName,
      'menuIcon': instance.menuIcon,
      'state': instance.state,
      'bedgeValue': instance.bedgeValue,
      'translateName': instance.translateName,
      'subMenuItems': instance.subMenuItems,
    };
