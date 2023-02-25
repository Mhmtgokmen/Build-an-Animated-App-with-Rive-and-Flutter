// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryInfoModel _$QueryInfoModelFromJson(Map<String, dynamic> json) =>
    QueryInfoModel(
      orderby: json['orderby'] as String,
      pager: (json['pager'] as List<dynamic>)
          .map((e) => PagerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QueryInfoModelToJson(QueryInfoModel instance) =>
    <String, dynamic>{
      'orderby': instance.orderby,
      'pager': instance.pager,
    };
