import 'package:flutter/material.dart';
import 'package:rive_animation/model/user_menu_info_model.dart';
import 'package:rive_animation/service/login_service.dart';
import 'package:rive_animation/shared/return_info.dart';

class FavoriPage extends StatefulWidget {
  FavoriPage({super.key, required this.session}) {
    menu = [];
  }
  final String session;
  // final LoginService loginService = LoginService();
  late List<UserMenuInfoModel> menu;
  @override
  State<FavoriPage> createState() => _FavoriPageState();
}

class _FavoriPageState extends State<FavoriPage> {
  final LoginService loginService = LoginService();

  @override
  void initState() {
    super.initState();
    (() async {
      widget.menu =
          (await loginService.getUserMenuInfo(widget.session)).data;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          itemCount: widget.menu.length,
          itemBuilder: (context, index) => ListTile(
            onTap: (){},
            leading: Text(widget.menu[index].state),
            title: Text(widget.menu[index].menuName),
          ),
        ),
      ),
    );
  }
}
