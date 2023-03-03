import 'package:flutter/material.dart';
import 'package:rive_animation/model/menu.dart';
import 'package:rive_animation/shared/pages/components/drop_down_list_item.dart';

class DropDownField extends StatefulWidget {
  DropDownField({
    super.key,
    required this.hintText,
    required this.dropdownItems,
    required this.valueText,
  });
  final String hintText;
  final List<DropDownListItem> dropdownItems;
  DropDownListItem? valueText;
  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  // DropDownListItem? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFEFEFF4),
      ),
      child: DropdownButtonFormField(
        value: widget.valueText,
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
        hint: Padding(
          padding: const EdgeInsets.only(left: 0),
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
        dropdownColor: Colors.white,
        items: widget.dropdownItems
            .map<DropdownMenuItem<DropDownListItem>>((DropDownListItem items) {
          return DropdownMenuItem<DropDownListItem>(
            value: items,
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                items.text,
                style: const TextStyle(
                  color: Color(0xFF8A8A8F),
                  fontSize: 17,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (DropDownListItem? newValue) {
          setState(() {
            widget.valueText = newValue!;
          });
        },
      ),
    );
  }
}
