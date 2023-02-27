// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryInfoModel _$QueryInfoModelFromJson(Map<String, dynamic> json) =>
    QueryInfoModel(
      orderby: json['orderby'] as String,
      pager: PagerModel.fromJson(json['pager'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueryInfoModelToJson(QueryInfoModel instance) =>
    <String, dynamic>{
      'orderby': instance.orderby,
      'pager': instance.pager,
    };
