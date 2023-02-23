import 'package:flutter/material.dart';
import 'package:rive_animation/screens/entryPoint/components/side_menu.dart';

class FavoriPage extends StatefulWidget {
  const FavoriPage({super.key});

  @override
  State<FavoriPage> createState() => _FavoriPageState();
}

class _FavoriPageState extends State<FavoriPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SideMenu(menu: null, press: () {  }, riveOnInit: (Artboard value) {  }, selectedMenu: null,),
    );
  }
}