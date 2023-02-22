import 'package:json_annotation/json_annotation.dart';

part 'auth_info.g.dart';

@JsonSerializable()
class AuthInfo {
  int authId;
  int authType;
  String authCode;
  String authDesc;

  AuthInfo({
    required this.authId,
    required this.authCode,
    required this.authDesc,
    required this.authType,
  });

  factory AuthInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthInfoToJson(this);
}
