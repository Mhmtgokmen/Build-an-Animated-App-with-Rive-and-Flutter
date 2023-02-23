import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter",
            ),
          ),
        ),
      ),
    );
  }
}
