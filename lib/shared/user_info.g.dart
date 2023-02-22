// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      firsName: json['firsName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      profilImage: json['profilImage'] as String?,
      userType: json['userType'] as int,
      sessionId: json['sessionId'] as String,
      token: json['token'] as String,
      language: json['language'] as int,
      customerId: json['customerId'] as int,
      employeeId: json['employeeId'] as int,
      languageCode: json['languageCode'] as String,
      parentSectorId: json['parentSectorId'] as int,
      authInfos: (json['authInfos'] as List<dynamic>)
          .map((e) => AuthInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'firsName': instance.firsName,
      'lastName': instance.lastName,
      'email': instance.email,
      'profilImage': instance.profilImage,
      'userType': instance.userType,
      'sessionId': instance.sessionId,
      'token': instance.token,
      'language': instance.language,
      'customerId': instance.customerId,
      'employeeId': instance.employeeId,
      'languageCode': instance.languageCode,
      'parentSectorId': instance.parentSectorId,
      'authInfos': instance.authInfos,
    };
