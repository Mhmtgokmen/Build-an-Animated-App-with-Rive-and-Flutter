import 'package:flutter/material.dart';
import 'package:rive_animation/screens/home/home_screen.dart';
import 'package:rive_animation/screens/search/favori_pages.dart';
import 'package:rive_animation/screens/search/help_page.dart';
import 'package:rive_animation/screens/loading/loading_page.dart';

import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}
// Menu(
//     userMenu: UserMenuInfoModel(
//         menuName: "SHIPMENT",
//         menuIcon: "money",
//         state: "shipment",
//         bedgeValue: 0,
//         translateName: "MAINMENU.SHIPMENT",
//         subMenuItems: [
//           SubMenuItemModel(
//               menuName: "LOADING",
//               status: "loading",
//               translateName: "LOADING.LOADINGMENU")
//         ]),
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "HOME",
//         stateMachineName: "HOME_interactivity"),
//   ),
//   Menu(
//     userMenu: UserMenuInfoModel(
//         menuName: "QUALITY",
//         menuIcon: "assignment_turned_in",
//         state: "quality",
//         bedgeValue: 0,
//         translateName: "MAINMENU.QUALITY",
//         subMenuItems: [
//           SubMenuItemModel(
//               menuName: "QUALITYCONTROL",
//               status: "qualitycontrol",
//               translateName: "QUALITYCONTROL.QUALITYCONTROLMENU")
//         ]),
//     rive: RiveModel(
//         src: "assets/RiveAssets/icons.riv",
//         artboard: "SEARCH",
//         stateMachineName: "SEARCH_Interactivity"),
//   ),
List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "Search",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  Menu(
    title: "Favorites",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
  Menu(
    title: "Help",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];
List<Menu> sidebarMenus2 = [
  Menu(
    title: "History",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu(
    title: "Notifications",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
];

List<Menu> bottomNavItems = [
  Menu(
    title: "Chat",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  Menu(
    title: "Search",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  Menu(
    title: "Timer",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
  Menu(
    title: "Notification",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
  Menu(
    title: "Profile",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity"),
  ),
];

List pages = [
  const HomePage(),
  LoadingPage(),
  FavoriPage(),
  const HelpPage(),
];

class PageManager {
  static Widget getByPageManger(int index) {
    return pages[index];
  }

  static Widget recreatePageByIndex(int index) {
    if (index == 0) {
      return const HomePage();
    }
    if (index == 1) {
      return LoadingPage();
    }
    if (index == 2) {
      return FavoriPage();
    } else {
      return const HelpPage();
    }
  }

  static void renewPageByIndex(int index) {
    pages[index] = recreatePageByIndex(index);
  }
}
