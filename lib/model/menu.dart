import 'package:flutter/cupertino.dart';
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

List<IconData> menuIcons = [
  CupertinoIcons.cube_box_fill,
  CupertinoIcons.checkmark_seal_fill,
  CupertinoIcons.doc_fill,
  CupertinoIcons.doc_chart_fill,
  CupertinoIcons.doc_checkmark_fill
];

class PageManager {
  static Widget getByPageManger(int index) {
    return pages[index];
  }

  static Widget recreatePageByIndex(int index, String status) {
    if (status == "loading") {
      return LoadingPage();
    }
    if (status == "qualitycontrol") {
      return const HomePage();
    }
    if (status == "stockcount") {
      return FavoriPage();
    }
    if (status == "stocktran") {
      return const HelpPage();
    }
    if (status == "transaction") {
      return const HelpPage();
    }
    if (status == "overtime") {
      return const HelpPage();
    }
    if (status == "permission") {
      return const HelpPage();
    } else {
      return const HelpPage();
    }
    // if (index == 0) {
    //   return  LoadingPage();
    // }
    // if (index == 1) {
    //   return const HomePage();
    // }
    // if (index == 2) {
    //   return FavoriPage();
    // } else {
    //   return const HelpPage();
    // }
  }

  static void renewPageByIndex(int index, String status) {
    pages[index] = recreatePageByIndex(index, status);
  }
}
