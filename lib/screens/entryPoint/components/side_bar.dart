import 'package:flutter/material.dart';
import 'package:rive/src/controllers/state_machine_controller.dart';
import 'package:rive_animation/events/sidebar_page_change.dart';
import 'package:rive_animation/model/user_menu_info_model.dart';
import 'package:rive_animation/service/login_service.dart';
import 'package:rive_animation/shared/return_info.dart';

import '../../../model/menu.dart';
import '../../../utils/rive_utils.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  SideBar({
    super.key,
  }) {
    loginService = LoginService();
    menu = [];
  }
  late int currentIndex;
  late List<UserMenuInfoModel> menu = [];
  //  late Menu menu;
  late ReturnInfo<dynamic> returnInfo;
  late LoginService loginService;
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  SideBarChangeEvent sideBarChangeEvent = SideBarChangeEvent();
  Menu selectedSideMenu = sidebarMenus.first;
  // UserMenuInfoModel? selectedSideMenu;
  final ScrollController controller = ScrollController();
  bool isSideBarOpen = false;
  late SMIBool isMenuOpenInput;
  late AnimationController _animationController;
  @override
  void initState() {
    getdata();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    super.initState();
  }

  Future<void> getdata() async {
    widget.menu = (await widget.loginService.getUserMenuInfo()).data;
    // setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoCard(
                  name: "Abu Anwar",
                  bio: "YouTuber",
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   controller: controller,
                //   itemCount: widget.menu.length,
                //   itemBuilder: (context, index) => ExpansionTile(
                //     title: Text(widget.menu[index].menuName),
                //     children: [
                //       ListView.builder(
                //         shrinkWrap: true,
                //         controller: controller,
                //         itemCount: widget.menu[index].subMenuItems.length,
                //         itemBuilder: (context, subMenuIndex) => ListTile(
                //           title: Text(
                //             widget.menu[index].subMenuItems[subMenuIndex]
                //                 .menuName,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // ...widget.menu
                //     .asMap()
                //     .map(
                //       (i, menu) => MapEntry(
                //         i,
                //         SideMenu(
                //           menu: menu,
                //           press: () {
                //             RiveUtils.chnageSMIBoolState(
                //                 menu.state as SMIBool);
                //             setState(() {
                //               selectedSideMenu = menu;
                //               SideBarChangeEvent.getInstance()
                //                   .broadcast(IndexEventArg(i));
                //             });
                //           },
                //           riveOnInit: (artboard) {
                //             // menu.rive.status = RiveUtils.getRiveInput(
                //             //     artboard,
                //             //     stateMachineName:
                //             //         menu.rive.stateMachineName);
                //           },
                //           selectedMenu: selectedSideMenu!,
                //         ),
                //       ),
                //     )
                //     .values
                //     .toList(),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    "Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                ...sidebarMenus
                    .asMap()
                    .map(
                      (i, menu) => MapEntry(
                        i,
                        SideMenu(
                          menu: menu,
                          selectedMenu: selectedSideMenu,
                          press: () {
                            RiveUtils.chnageSMIBoolState(menu.rive.status!);
                            setState(() {
                              selectedSideMenu = menu;
                              SideBarChangeEvent.getInstance()
                                  .broadcast(IndexEventArg(i));
                            });
                          },
                          riveOnInit: (artboard) {
                            menu.rive.status = RiveUtils.getRiveInput(artboard,
                                stateMachineName: menu.rive.stateMachineName);
                          },
                        ),
                      ),
                    )
                    .values
                    .toList(),
                // Padding(
                //   padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                //   child: Text(
                //     "History".toUpperCase(),
                //     style: Theme.of(context)
                //         .textTheme
                //         .titleMedium!
                //         .copyWith(color: Colors.white70),
                //   ),
                // ),
                // ...sidebarMenus2
                //     .map((menu) => SideMenu(
                //           menu: menu,
                //           selectedMenu: selectedSideMenu,
                //           press: () {
                //             RiveUtils.chnageSMIBoolState(menu.rive.status!);
                //             setState(() {
                //               selectedSideMenu = menu;
                //             });
                //           },
                //           riveOnInit: (artboard) {
                //             menu.rive.status = RiveUtils.getRiveInput(artboard,
                //                 stateMachineName: menu.rive.stateMachineName);
                //           },
                //         ))
                //     .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
