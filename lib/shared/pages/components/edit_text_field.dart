import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  EditTextField({
    Key? key,
    required this.labelText,
    this.top = 16,
    this.left = 16,
    this.right = 16,
    this.isReadOnly = false,
    this.onChange,
    required this.value,
  }) : super(key: key) {
    controller = TextEditingController();
    controller.text = value;
  }

  late TextEditingController controller;
  final String labelText;
  final double top;
  final double left;
  final double right;
  final bool isReadOnly;
  final Function(String)? onChange;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: top),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: onChange,
        readOnly: isReadOnly,
        controller: controller,
        // maxLines: 2,
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
