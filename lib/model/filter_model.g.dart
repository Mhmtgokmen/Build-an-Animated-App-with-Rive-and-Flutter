// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel<T> _$FilterModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    FilterModel<T>(
      filter: _$nullableGenericFromJson(json['filter'], fromJsonT),
      queryInfo: (json['queryInfo'] as List<dynamic>)
          .map((e) => QueryInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isExport: json['isExport'] as bool,
      columnInfos: (json['columnInfos'] as List<dynamic>)
          .map((e) => ColumnInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterModelToJson<T>(
  FilterModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'filter': _$nullableGenericToJson(instance.filter, toJsonT),
      'queryInfo': instance.queryInfo,
      'isExport': instance.isExport,
      'columnInfos': instance.columnInfos,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
