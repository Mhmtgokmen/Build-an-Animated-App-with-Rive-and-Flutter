import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DateTimeField extends StatefulWidget {
  DateTimeField({
    super.key,
    required this.labelText,
    required this.selectedDate,
    required this.callback,
  });
  final String labelText;
  late DateTime? selectedDate;
  late Function callback;
  @override
  State<DateTimeField> createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<DateTimeField> {
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
        // use24hFormat: true,
        initialValue: widget.selectedDate,
        onDateSelected: (DateTime? value) {
          widget.selectedDate = value;
          widget.callback(widget.selectedDate);
        },
        dateFormat: DateFormat('y/M/d'),
        mode: DateTimeFieldPickerMode.date,
        autovalidateMode: AutovalidateMode.always,
        // validator: (DateTime? e) =>
        //               (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
      ),
    );
  }
}
