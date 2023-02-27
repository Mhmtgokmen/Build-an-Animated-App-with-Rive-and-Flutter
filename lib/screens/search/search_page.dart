import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rive_animation/model/filter_model.dart';
import 'package:rive_animation/model/loading_filter_model.dart';
import 'package:rive_animation/model/pager_model.dart';
import 'package:rive_animation/model/query_info_model.dart';
import 'package:rive_animation/service/loading_service.dart';
import 'package:rive_animation/shared/return_info.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key, required this.session}) {
    loadingService = LoadingService();
    filter = FilterModel(
      filter: LoadingFilterModel(),
      queryInfo: QueryInfoModel(
        orderby: "loadingId",
        pager: PagerModel(
          currentPage: currentPage,
          pageSize: pageSize,
        ),
      ),
      isExport: false,
      columnInfos: null,
    );
  }

  final String session;
  late FilterModel<LoadingFilterModel> filter;
  late ReturnInfo<dynamic> returnInfo;
  late LoadingService loadingService;
  final int pageSize = 10;
  final int currentPage = 0;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final PagingController<int, dynamic> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> fetchPage(int page) async {
    try {
      final newItems =
          await widget.loadingService.getLoadingList(widget.filter);
      final isLastPage = newItems.data.length < widget.pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.data);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(newItems.data, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PagedListView<int, dynamic>(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            itemBuilder: (context, item, index) => ListTile(
              leading: Text(item.loadingId),
              title: Text(item.representativeName),
            ),
          ),
        ),
      ),
    );
  }
}
