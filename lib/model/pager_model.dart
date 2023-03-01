import 'package:json_annotation/json_annotation.dart';

part 'pager_model.g.dart';

@JsonSerializable()
class PagerModel {
  int? totalCount;
  int pageSize;
  int currentPage;

  PagerModel({
    this.totalCount,
    required this.pageSize,
    required this.currentPage,
  });

  factory PagerModel.fromJson(Map<String, dynamic> json) =>
      _$PagerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PagerModelToJson(this);
  int getTotalPageCount() {
    int pageCount = (totalCount! ~/ pageSize);
    if (totalCount! % pageSize != 0) {
      pageCount++;
    }
    return pageCount;
  }

  bool isLastPage() {
    if (getTotalPageCount() == currentPage) {
      return true;
    }
    return false;
  }
}
