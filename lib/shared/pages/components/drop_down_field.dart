import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({super.key, required this.hintText});
  final String hintText;
  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFEFEFF4),
      ),
      child: DropdownButtonFormField(
        value: selectedValue,
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Color(0xFFEFEFF4),
        ),
        hint:  Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            widget.hintText,
            style: const TextStyle(
              fontSize: 17,
              color: Color(0xFF8A8A8F),
            ),
          ),
        ),
        icon: const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 26,
            color: Color(0xFF8A8A8F),
          ),
        ),
        focusColor: const Color(0xFFEFEFF4),
        dropdownColor: const Color(0xFFEFEFF4),
        items: dropdownItems,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
      ),
    );
  }
}

String? selectedValue;
List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "1",
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          "40 HC",
          style: TextStyle(
            color: Color(0xFF8A8A8F),
            fontSize: 17,
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "2",
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          "20 DC",
          style: TextStyle(
            color: Color(0xFF8A8A8F),
            fontSize: 17,
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "3",
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          "PARSİYEL - DENİZ",
          style: TextStyle(
            color: Color(0xFF8A8A8F),
            fontSize: 17,
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "4",
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          "ACIK GEMİ YÜKÜ",
          style: TextStyle(
            color: Color(0xFF8A8A8F),
            fontSize: 17,
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "5",
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          "PARSİYEL - HAVA",
          style: TextStyle(
            color: Color(0xFF8A8A8F),
            fontSize: 17,
          ),
        ),
      ),
    ),
    const DropdownMenuItem(
      value: "6",
      child: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          "PARSİYEL - KARA",
          style: TextStyle(
            color: Color(0xFF8A8A8F),
            fontSize: 17,
          ),
        ),
      ),
    ),
  ];
  return menuItems;
}
