import 'package:flutter/material.dart';
import 'package:rive_animation/model/item_for_combo_model.dart';

class AutocompleteTextField extends StatefulWidget {
  AutocompleteTextField({
    super.key,
    required this.dataList,
    required this.labelText,
    this.top = 16,
    this.left = 16,
    this.right = 16,
    this.onSelected,
    required this.value,
  });

  final List<ItemForComboModel> dataList;
  final String labelText;
  final double top;
  final double left;
  final double right;
  final Function(ItemForComboModel)? onSelected;
  final String value;
  @override
  State<AutocompleteTextField> createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  static String _displayString(ItemForComboModel option) => option.displayText;
  @override
  Widget build(BuildContext context) {
    return Autocomplete<ItemForComboModel>(
      displayStringForOption: _displayString,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<ItemForComboModel>.empty();
        }
        return widget.dataList.where((ItemForComboModel option) {
          return option.displayText.contains(textEditingValue.text);
        });
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        textEditingController.text = widget.value;
        return Container(
          margin: EdgeInsets.only(
              left: widget.left, right: widget.right, top: widget.top),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: textEditingController,
            focusNode: focusNode,
            onEditingComplete: onFieldSubmitted,
            decoration: InputDecoration(
              labelText: widget.labelText,
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
      },
      onSelected: widget.onSelected,
    );
  }
}
