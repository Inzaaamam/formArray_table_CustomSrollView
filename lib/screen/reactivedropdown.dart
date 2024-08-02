import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveCustomDropdown extends StatelessWidget {
  final FormControl<String> formControl;
  final List<String> items;
  final String? hintText;
  final String? initialValue;
  final Color borderColorTop;
  final Color borderColorBottom;
  final Color borderColorLeft;
  final Color borderColorRight;
  final double borderWidthTop;
  final double borderWidthBottom;
  final double borderWidthLeft;
  final double borderWidthRight;
  final String hint;

  const ReactiveCustomDropdown({
    super.key,
    required this.formControl,
    required this.items,
    this.hintText,
    this.initialValue,
    this.borderColorTop = Colors.transparent,
    this.borderColorBottom = Colors.transparent,
    this.borderColorLeft = Colors.transparent,
    this.borderColorRight = Colors.transparent,
    this.borderWidthTop = 0.0,
    this.borderWidthBottom = 0.0,
    this.borderWidthLeft = 0.0,
    this.borderWidthRight = 0.0,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: borderColorTop,
            width: borderWidthTop,
          ),
          bottom: BorderSide(
            color: borderColorBottom,
            width: borderWidthBottom,
          ),
          left: BorderSide(
            color: borderColorLeft,
            width: borderWidthLeft,
          ),
          right: BorderSide(
            color: borderColorRight,
            width: borderWidthRight,
          ),
        ),
      ),
      child: ReactiveDropdownField<String>(
        // ignore: unnecessary_brace_in_string_interps
        hint: Text('${hint}'),
        iconSize: 16,
        formControl: formControl,
        isExpanded: true,
        decoration: InputDecoration(
          // prefixIconConstraints: BoxConstraints.tight(Size.square(1)),
          hintText: hintText,
          suffixIconColor: Colors.transparent,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 6, 12),
          // suffixIcon: const Icon(
          //   Icons.arrow_drop_down,
          //   size: 20,
          // ),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
