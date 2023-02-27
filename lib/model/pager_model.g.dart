// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pager_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagerModel _$PagerModelFromJson(Map<String, dynamic> json) => PagerModel(
      totalCount: json['totalCount'] as int?,
      pageSize: json['pageSize'] as int,
      currentPage: json['currentPage'] as int,
    );

Map<String, dynamic> _$PagerModelToJson(PagerModel instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
    };
