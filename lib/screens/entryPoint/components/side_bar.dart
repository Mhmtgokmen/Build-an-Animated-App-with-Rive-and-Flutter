import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rive_animation/events/sidebar_page_change.dart';
import 'package:rive_animation/model/sub_menu_item_model.dart';
import 'package:rive_animation/model/user_menu_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/menu.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
    required this.menu,
  });
  final List<UserMenuInfoModel> menu;
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  SideBarChangeEvent sideBarChangeEvent = SideBarChangeEvent();
  SubMenuItemModel? selectedSideMenu;
  final ScrollController controller = ScrollController();
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    super.initState();
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
                GestureDetector(
                  onTap: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                  },
                  child: const InfoCard(
                    name: "Mehmet GÖKMEN",
                    bio: "Yazılım",
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  controller: controller,
                  itemCount: widget.menu.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, top: 32, bottom: 16),
                        child: Text(
                          translate(widget.menu[index].translateName)
                              .toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white70),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        controller: controller,
                        itemCount: widget.menu[index].subMenuItems.length,
                        itemBuilder: (context, subMenuIndex) => SideMenu(
                          menu: widget.menu[index].subMenuItems[subMenuIndex],
                          press: () {
                            setState(() {
                              selectedSideMenu =
                                  widget.menu[index].subMenuItems[subMenuIndex];
                              SideBarChangeEvent.getInstance().broadcast(
                                IndexEventArg(
                                  subMenuIndex,
                                  widget.menu[index].subMenuItems[subMenuIndex]
                                      .status,
                                ),
                              );
                            });
                          },
                          riveOnInit: (artboard) {},
                          selectedMenu: selectedSideMenu,
                          icon: menuIcons[subMenuIndex],
                        ),
                      ),
                    ],
                  ),
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   controller: controller,
                //   itemCount: widget.menu.length,
                //   itemBuilder: (context, index) => ExpansionTile(
                //     title: Text(
                //       widget.menu[index].menuName,
                //       style: const TextStyle(color: Colors.white),
                //     ),
                //     textColor: Colors.white,
                //     children: [
                //       ListView.builder(
                //         shrinkWrap: true,
                //         controller: controller,
                //         itemCount: widget.menu[index].subMenuItems.length,
                //         itemBuilder: (context, subMenuIndex) => ListTile(
                //           title: Text(
                //               widget.menu[index].subMenuItems[subMenuIndex]
                //                   .menuName,
                //               style: const TextStyle(color: Colors.white)),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                //   child: Text(
                //     widget.menu.toUpperCase(),
                //     style: Theme.of(context)
                //         .textTheme
                //         .titleMedium!
                //         .copyWith(color: Colors.white70),
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
                //             RiveUtils.chnageSMIBoolState(menu.state as SMIBool);
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
                //           selectedMenu: selectedSideMenu ?? widget.menu.first,
                //         ),
                //       ),
                //     )
                //     .values
                //     .toList(),
                // Padding(
                //   padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                //   child: Text(
                //     "Browse".toUpperCase(),
                //     style: Theme.of(context)
                //         .textTheme
                //         .titleMedium!
                //         .copyWith(color: Colors.white70),
                //   ),
                // ),
                // ...sidebarMenus
                //     .asMap()
                //     .map(
                //       (i, menu) => MapEntry(
                //         i,
                //         SideMenu(
                //           menu: menu,
                //           selectedMenu: selectedSideMenu,
                //           press: () {
                //             RiveUtils.chnageSMIBoolState(menu.rive.status!);
                //             setState(() {
                //               selectedSideMenu = menu;
                //               SideBarChangeEvent.getInstance()
                //                   .broadcast(IndexEventArg(i));
                //             });
                //           },
                //           riveOnInit: (artboard) {
                //             menu.rive.status = RiveUtils.getRiveInput(artboard,
                //                 stateMachineName: menu.rive.stateMachineName);
                //           },
                //         ),
                //       ),
                //     )
                //     .values
                //     .toList(),
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
