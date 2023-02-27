// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadingModel _$LoadingModelFromJson(Map<String, dynamic> json) => LoadingModel(
      loadingId: json['loadingId'] as int,
      beforeLoadingId: json['beforeLoadingId'] as int,
      beforeLoadingDocumentNo: json['beforeLoadingDocumentNo'] as String,
      beforeLoadingDescription: json['beforeLoadingDescription'] as String,
      description: json['description'] as String,
      note: json['note'] as String,
      containerType: json['containerType'] as int,
      containerTypeText: json['containerTypeText'] as String,
      quantity: json['quantity'] as int,
      cbmLimit: (json['cbmLimit'] as num).toDouble(),
      kgLimit: (json['kgLimit'] as num).toDouble(),
      status: json['status'] as int,
      totalLoadingCbm: (json['totalLoadingCbm'] as num?)?.toDouble(),
      totoalLoadingKg: (json['totoalLoadingKg'] as num?)?.toDouble(),
      createdDate: DateTime.parse(json['createdDate'] as String),
      createdUser: json['createdUser'] as int,
      updatedDate: DateTime.parse(json['updatedDate'] as String),
      updatedUser: json['updatedUser'] as int,
      createdUserText: json['createdUserText'] as String,
      updatedUserText: json['updatedUserText'] as String,
      customerId: json['customerId'] as int,
      customerCode: json['customerCode'] as String,
      customerName: json['customerName'] as String,
      loadingItemCount: json['loadingItemCount'] as int,
      loadingImageCount: json['loadingImageCount'] as int,
      loadingDate: json['loadingDate'] == null
          ? null
          : DateTime.parse(json['loadingDate'] as String),
      representativeName: json['representativeName'] as String,
      representative: json['representative'] as int?,
      responsible: json['responsible'] as int?,
      responsibleName: json['responsibleName'] as String,
    );

Map<String, dynamic> _$LoadingModelToJson(LoadingModel instance) =>
    <String, dynamic>{
      'loadingId': instance.loadingId,
      'beforeLoadingId': instance.beforeLoadingId,
      'beforeLoadingDocumentNo': instance.beforeLoadingDocumentNo,
      'beforeLoadingDescription': instance.beforeLoadingDescription,
      'description': instance.description,
      'note': instance.note,
      'containerType': instance.containerType,
      'containerTypeText': instance.containerTypeText,
      'quantity': instance.quantity,
      'cbmLimit': instance.cbmLimit,
      'kgLimit': instance.kgLimit,
      'status': instance.status,
      'totalLoadingCbm': instance.totalLoadingCbm,
      'totoalLoadingKg': instance.totoalLoadingKg,
      'createdDate': instance.createdDate.toIso8601String(),
      'createdUser': instance.createdUser,
      'updatedDate': instance.updatedDate.toIso8601String(),
      'updatedUser': instance.updatedUser,
      'createdUserText': instance.createdUserText,
      'updatedUserText': instance.updatedUserText,
      'customerId': instance.customerId,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'loadingItemCount': instance.loadingItemCount,
      'loadingImageCount': instance.loadingImageCount,
      'loadingDate': instance.loadingDate?.toIso8601String(),
      'representativeName': instance.representativeName,
      'representative': instance.representative,
      'responsible': instance.responsible,
      'responsibleName': instance.responsibleName,
    };
