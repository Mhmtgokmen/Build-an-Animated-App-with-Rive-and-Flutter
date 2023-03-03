import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoadingItemFilterModel{
  int? loadingItemId;
  int? loadingId;
  int? beforeLoadingItemId;
  int? beforeLoadingId;
  int? productId;
  String? productName;
  String? productImage;
  String? productDesc;
  int? supplierId;
  String? supplierName;
  int? unitId;
  String? unit;
  int? quantity;
  DateTime? createdDate;
  int? createdUser;
  DateTime? updatedDate;
  int? updatedUser;
  String? createdUserText;
  String? updatedUserText;

  LoadingItemFilterModel({
     this.loadingItemId,
     this.loadingId,
     this.beforeLoadingItemId,
     this.beforeLoadingId,
     this.productId,
     this.productName,
     this.productImage,
     this.productDesc,
     this.supplierId,
     this.supplierName,
     this.unitId,
     this.unit,
     this.quantity,
     this.createdDate,
     this.createdUser,
     this.updatedDate,
     this.updatedUser,
     this.createdUserText,
     this.updatedUserText,
  });
}