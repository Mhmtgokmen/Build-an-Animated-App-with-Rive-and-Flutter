import 'package:flutter/material.dart';

class ButtonField extends StatelessWidget {
  const ButtonField({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, top: 24),
      // width: 346,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
