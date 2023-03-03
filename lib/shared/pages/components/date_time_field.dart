import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DateTimeField extends StatefulWidget {
  const DateTimeField({super.key, required this.labelText});
  final String labelText;
  @override
  State<DateTimeField> createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFEFEFF4),
      ),
      child: DateTimeFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Iconsax.note_favorite),
          ),
        ),
        // onDateSelected: (DateTime value){
        //   selectedDate = value;
        // },
        dateFormat: DateFormat('y/M/d'),
        mode: DateTimeFieldPickerMode.date,
        autovalidateMode: AutovalidateMode.always,
        // validator: (DateTime? e) =>
        //               (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
      ),
    );
  }
}
