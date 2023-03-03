import 'package:json_annotation/json_annotation.dart';
part 'loading_item_model.g.dart';

@JsonSerializable()
class LoadingItemModel {
  int loadingItemId;
  int loadingId;
  int beforeLoadingItemId;
  int beforeLoadingId;
  int productId;
  String productName;
  String productImage;
  String productDesc;
  int supplierId;
  String supplierName;
  int unitId;
  String unit;
  int quantity;
  DateTime createdDate;
  int createdUser;
  DateTime updatedDate;
  int updatedUser;
  String createdUserText;
  String updatedUserText;

  LoadingItemModel({
    required this.loadingItemId,
    required this.loadingId,
    required this.beforeLoadingItemId,
    required this.beforeLoadingId,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productDesc,
    required this.supplierId,
    required this.supplierName,
    required this.unitId,
    required this.unit,
    required this.quantity,
    required this.createdDate,
    required this.createdUser,
    required this.updatedDate,
    required this.updatedUser,
    required this.createdUserText,
    required this.updatedUserText,
  });

  factory LoadingItemModel.fromJson(Map<String, dynamic> json) =>
      _$LoadingItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoadingItemModelToJson(this);
}
