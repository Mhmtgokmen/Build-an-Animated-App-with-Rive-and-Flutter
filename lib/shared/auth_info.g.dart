// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthInfo _$AuthInfoFromJson(Map<String, dynamic> json) => AuthInfo(
      authId: json['authId'] as int,
      authCode: json['authCode'] as String,
      authDesc: json['authDesc'] as String,
      authType: json['authType'] as int,
    );

Map<String, dynamic> _$AuthInfoToJson(AuthInfo instance) => <String, dynamic>{
      'authId': instance.authId,
      'authType': instance.authType,
      'authCode': instance.authCode,
      'authDesc': instance.authDesc,
    };
