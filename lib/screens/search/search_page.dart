import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rive_animation/model/filter_model.dart';
import 'package:rive_animation/service/loading_service.dart';
import 'package:rive_animation/shared/return_info.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key, required this.session}) {
    loadingService = LoadingService();
    filter = [];
  }

  final String session;
  late List<FilterModel> filter;
  late ReturnInfo<dynamic> returnInfo;
  late LoadingService loadingService;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final PagingController<int, dynamic> pagingController =
      PagingController(firstPageKey: 0);

  final int pageSize = 10;

  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> fetchPage(pageKey) async {
    try {
      final newItems =
          await widget.loadingService.getLoadingList(widget.session);
      final isLastPage = newItems.data.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.data);
      } else {
        final nextPageKey = pageKey + 1;
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
            itemBuilder: (context, item, index) => const ListTile(
              leading: Text(""),
              title: Text(""),
            ),
          ),
        ),
      ),
    );
  }
}
