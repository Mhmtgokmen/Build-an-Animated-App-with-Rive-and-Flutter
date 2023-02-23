// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubMenuItemModel _$SubMenuItemModelFromJson(Map<String, dynamic> json) =>
    SubMenuItemModel(
      menuName: json['menuName'] as String,
      status: json['status'] as String,
      translateName: json['translateName'] as String,
    );

Map<String, dynamic> _$SubMenuItemModelToJson(SubMenuItemModel instance) =>
    <String, dynamic>{
      'menuName': instance.menuName,
      'status': instance.status,
      'translateName': instance.translateName,
    };
