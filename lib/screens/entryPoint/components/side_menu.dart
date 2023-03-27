import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/model/sub_menu_item_model.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.menu,
    required this.press,
    required this.riveOnInit,
    required this.selectedMenu,
    required this.icon,
  });

  final SubMenuItemModel menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final SubMenuItemModel? selectedMenu;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: selectedMenu == menu ? 288 : 0,
              height: 56,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 36,
                width: 36,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
                // child: RiveAnimation.asset(
                //   "assets/RiveAssets/icons.riv",
                //   //  menu.rive.src,
                //   artboard: "HOME",
                //   onInit: riveOnInit,
                // ),
              ),
              title: Text(
                translate(menu.translateName),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
