import 'package:json_annotation/json_annotation.dart';

part 'loading_filter_model.g.dart';

@JsonSerializable()
class LoadingFilterModel {
  int? loadingId;
  int? beforeLoadingId;
  String? beforeLoadingDocumentNo;
  String? beforeLoadingDescription;
  String? description;
  String? note;
  int? containerType;
  String? containerTypeText;
  int? quantity;
  double? cbmLimit;
  double? kgLimit;
  int? status;
  double? totalLoadingCbm;
  double? totoalLoadingKg;
  DateTime? createdDate;
  int? createdUser;
  DateTime? updatedDate;
  int? updatedUser;
  String? createdUserText;
  String? updatedUserText;
  int? customerId;
  String? customerCode;
  String? customerName;
  int? loadingItemCount;
  int? loadingImageCount;
  DateTime? loadingDate;
  String? representativeName;
  int? representative;
  int? responsible;
  String? responsibleName;

  LoadingFilterModel({
   this.loadingId,
   this.beforeLoadingId,
   this.beforeLoadingDocumentNo,
   this.beforeLoadingDescription,
   this.description,
   this.note,
   this.containerType,
   this.containerTypeText,
   this.quantity,
   this.cbmLimit,
   this.kgLimit,
   this.status,
   this.totalLoadingCbm,
   this.totoalLoadingKg,
   this.createdDate,
   this.createdUser,
   this.updatedDate,
   this.updatedUser,
   this.createdUserText,
   this.updatedUserText,
   this.customerId,
   this.customerCode,
   this.customerName,
   this.loadingItemCount,
   this.loadingImageCount,
   this.loadingDate,
   this.representativeName,
   this.representative,
   this.responsible,
   this.responsibleName,
  });

  factory LoadingFilterModel.fromJson(Map<String, dynamic> json) =>
      _$LoadingFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoadingFilterModelToJson(this);
}
