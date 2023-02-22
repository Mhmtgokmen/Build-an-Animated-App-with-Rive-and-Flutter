import 'package:json_annotation/json_annotation.dart';

part 'return_info.g.dart';

@JsonSerializable(
    genericArgumentFactories: true, fieldRename: FieldRename.snake)
class ReturnInfo<T> {
  @JsonKey(name: 'totalCount')
  int totalCount;
  @JsonKey(name: 'isSuccess')
  bool isSuccess;
  @JsonKey(name: 'data')
  T? data;
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'errorMessage')
  String? errorMessage;
  @JsonKey(name: 'isLoginRequired')
  bool isLoginRequired;

  ReturnInfo(
      {required this.totalCount,
      required this.isSuccess,
      required this.data,
      required this.key,
      required this.message,
      required this.errorMessage,
      required this.isLoginRequired});

  factory ReturnInfo.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ReturnInfoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ReturnInfoToJson(this, toJsonT);
}
