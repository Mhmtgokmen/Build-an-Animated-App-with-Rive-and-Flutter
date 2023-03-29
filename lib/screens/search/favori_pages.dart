import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rive_animation/model/user_menu_info_model.dart';
import 'package:rive_animation/service/login_service.dart';
import 'package:rive_animation/shared/return_info.dart';

class FavoriPage extends StatefulWidget {
  FavoriPage({super.key}) {
    loginService = LoginService();
  }
  late List<UserMenuInfoModel> menu = [];
  late ReturnInfo<dynamic> returnInfo;
  late LoginService loginService;
  @override
  State<FavoriPage> createState() => _FavoriPageState();
}

class _FavoriPageState extends State<FavoriPage> {
  final ScrollController controller = ScrollController();
  final PagingController<int, dynamic> pagingController =
      PagingController(firstPageKey: 0);

  final int pageSize = 0;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    widget.menu =
        (await widget.loginService.getUserMenuInfo()).data;
    setState(() {});
  }

  // Future<void> fetchPage(pageKey) async {
  //   try {
  //     final newItems =
  //         await widget.loginService.getUserMenuInfo(widget.session);
  //     final isLastPage = newItems.data.length < pageSize;
  //     if (isLastPage) {
  //       pagingController.appendLastPage(newItems.data);
  //     } else {
  //       final nextPageKey = pageKey + newItems.data.length;
  //       pagingController.appendPage(newItems.data, nextPageKey);
  //     }
  //   } catch (error) {
  //     pagingController.error = error;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          shrinkWrap: true,
          controller: controller,
          itemCount: widget.menu.length,
          itemBuilder: (context, index) => ExpansionTile(
            title: Text(widget.menu[index].menuName),
            children: [
              ListView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: widget.menu[index].subMenuItems.length,
                itemBuilder: (context, subMenuIndex) => ListTile(
                  title: Text(
                    widget.menu[index].subMenuItems[subMenuIndex].menuName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
