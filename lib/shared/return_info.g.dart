// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnInfo<T> _$ReturnInfoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ReturnInfo<T>(
      totalCount: json['totalCount'] as int,
      isSuccess: json['isSuccess'] as bool,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      key: json['key'] as String?,
      message: json['message'] as String?,
      errorMessage: json['errorMessage'] as String?,
      isLoginRequired: json['isLoginRequired'] as bool,
    );

Map<String, dynamic> _$ReturnInfoToJson<T>(
  ReturnInfo<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'isSuccess': instance.isSuccess,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'key': instance.key,
      'message': instance.message,
      'errorMessage': instance.errorMessage,
      'isLoginRequired': instance.isLoginRequired,
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
