import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    Key? key,
    required this.labelText,
    this.top = 16,
    this.controller,
    this.left = 16,
    this.right = 16,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final double top;
  final double left;
  final double right;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: top),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintStyle: const TextStyle(
            fontSize: 17,
            color: Color(0xFF8A8A8F),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.only(left: 15),
        ),
      ),
    );
  }
}
