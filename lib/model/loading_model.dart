import 'package:json_annotation/json_annotation.dart';

part 'loading_model.g.dart';

@JsonSerializable()
class LoadingModel {
  int loadingId;
  int beforeLoadingId;
  String beforeLoadingDocumentNo;
  String beforeLoadingDescription;
  String description;
  String note;
  int containerType;
  String containerTypeText;
  int quantity;
  double cbmLimit;
  double kgLimit;
  int status;
  double? totalLoadingCbm;
  double? totoalLoadingKg;
  DateTime createdDate;
  int createdUser;
  DateTime updatedDate;
  int updatedUser;
  String createdUserText;
  String updatedUserText;
  int customerId;
  String customerCode;
  String customerName;
  int loadingItemCount;
  int loadingImageCount;
  DateTime? loadingDate;
  String representativeName;
  int? representative;
  int? responsible;
  String responsibleName;

  LoadingModel({
    required this.loadingId,
    required this.beforeLoadingId,
    required this.beforeLoadingDocumentNo,
    required this.beforeLoadingDescription,
    required this.description,
    required this.note,
    required this.containerType,
    required this.containerTypeText,
    required this.quantity,
    required this.cbmLimit,
    required this.kgLimit,
    required this.status,
    required this.totalLoadingCbm,
    required this.totoalLoadingKg,
    required this.createdDate,
    required this.createdUser,
    required this.updatedDate,
    required this.updatedUser,
    required this.createdUserText,
    required this.updatedUserText,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    required this.loadingItemCount,
    required this.loadingImageCount,
    required this.loadingDate,
    required this.representativeName,
    required this.representative,
    required this.responsible,
    required this.responsibleName,
  });

  factory LoadingModel.fromJson(Map<String, dynamic> json) =>
      _$LoadingModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoadingModelToJson(this);
}
