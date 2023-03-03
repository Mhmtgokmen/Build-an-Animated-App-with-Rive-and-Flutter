// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadingItemModel _$LoadingItemModelFromJson(Map<String, dynamic> json) =>
    LoadingItemModel(
      loadingItemId: json['loadingItemId'] as int,
      loadingId: json['loadingId'] as int,
      beforeLoadingItemId: json['beforeLoadingItemId'] as int,
      beforeLoadingId: json['beforeLoadingId'] as int,
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      productDesc: json['productDesc'] as String,
      supplierId: json['supplierId'] as int,
      supplierName: json['supplierName'] as String,
      unitId: json['unitId'] as int,
      unit: json['unit'] as String,
      quantity: json['quantity'] as int,
      createdDate: DateTime.parse(json['createdDate'] as String),
      createdUser: json['createdUser'] as int,
      updatedDate: DateTime.parse(json['updatedDate'] as String),
      updatedUser: json['updatedUser'] as int,
      createdUserText: json['createdUserText'] as String,
      updatedUserText: json['updatedUserText'] as String,
    );

Map<String, dynamic> _$LoadingItemModelToJson(LoadingItemModel instance) =>
    <String, dynamic>{
      'loadingItemId': instance.loadingItemId,
      'loadingId': instance.loadingId,
      'beforeLoadingItemId': instance.beforeLoadingItemId,
      'beforeLoadingId': instance.beforeLoadingId,
      'productId': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'productDesc': instance.productDesc,
      'supplierId': instance.supplierId,
      'supplierName': instance.supplierName,
      'unitId': instance.unitId,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'createdDate': instance.createdDate.toIso8601String(),
      'createdUser': instance.createdUser,
      'updatedDate': instance.updatedDate.toIso8601String(),
      'updatedUser': instance.updatedUser,
      'createdUserText': instance.createdUserText,
      'updatedUserText': instance.updatedUserText,
    };
