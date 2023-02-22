import 'package:json_annotation/json_annotation.dart';
import 'package:rive_animation/shared/auth_info.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  int userId;
  String userName;
  String firsName;
  String lastName;
  String? email;
  String? profilImage;
  int userType;
  String sessionId;
  String token;
  int language;
  int customerId;
  int employeeId;
  String languageCode;
  int parentSectorId;
  List<AuthInfo> authInfos;

  UserInfo({
    required this.userId,
    required this.userName,
    required this.firsName,
    required this.lastName,
    required this.email,
    required this.profilImage,
    required this.userType,
    required this.sessionId,
    required this.token,
    required this.language,
    required this.customerId,
    required this.employeeId,
    required this.languageCode,
    required this.parentSectorId,
    required this.authInfos,
  });
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
