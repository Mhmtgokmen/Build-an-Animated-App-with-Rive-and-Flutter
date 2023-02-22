import 'package:flutter/material.dart';

class FavoriPage extends StatefulWidget {
  const FavoriPage({super.key});

  @override
  State<FavoriPage> createState() => _FavoriPageState();
}

class _FavoriPageState extends State<FavoriPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
          child: Text("Favori"),
        
      ),
    );
  }
}