import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveCustomDropdown extends StatelessWidget {
  final FormControl<String> formControl;
  final List<String> items;
  final String? hintText;
  final String? initialValue;
  final Widget suffixIcon;
  // Border customization properties
  final Color borderColorTop;
  final Color borderColorBottom;
  final Color borderColorLeft;
  final Color borderColorRight;
  final double borderWidthTop;
  final double borderWidthBottom;
  final double borderWidthLeft;
  final double borderWidthRight;

  const ReactiveCustomDropdown({
    super.key,
    required this.formControl,
    required this.items,
    this.hintText,
    this.initialValue,
    required this.suffixIcon,

    // Default values for border properties
    this.borderColorTop = Colors.transparent,
    this.borderColorBottom = Colors.transparent,
    this.borderColorLeft = Colors.transparent,
    this.borderColorRight = Colors.transparent,
    this.borderWidthTop = 0.0,
    this.borderWidthBottom = 0.0,
    this.borderWidthLeft = 0.0,
    this.borderWidthRight = 0.0,
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
        formControl: formControl,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIconColor: Colors.transparent,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          suffixIcon: suffixIcon,
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

class RCustomDropdown extends StatelessWidget {
  final String formControlName;
  final List<String> items;
  final String? hintText;
  final String? initialValue;
  final Widget suffixIcon;

  // Border customization properties
  final Color borderColorTop;
  final Color borderColorBottom;
  final Color borderColorLeft;
  final Color borderColorRight;
  final double borderWidthTop;
  final double borderWidthBottom;
  final double borderWidthLeft;
  final double borderWidthRight;

  const RCustomDropdown({
    super.key,
    required this.formControlName,
    required this.items,
    this.hintText,
    this.initialValue,
    required this.suffixIcon,

    // Default values for border properties
    this.borderColorTop = Colors.transparent,
    this.borderColorBottom = Colors.transparent,
    this.borderColorLeft = Colors.transparent,
    this.borderColorRight = Colors.transparent,
    this.borderWidthTop = 0.0,
    this.borderWidthBottom = 0.0,
    this.borderWidthLeft = 0.0,
    this.borderWidthRight = 0.0,
    required Null Function(dynamic value) onChanged,
    required FormControl<String> formControl,
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
        formControlName: formControlName,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIconColor: Colors.transparent,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          suffixIcon: suffixIcon,
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
