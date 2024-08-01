import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TextWidgetForm extends StatelessWidget {
  final FormControl<String> formControl;
  final String hintText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<FormControl<String>>? onFieldSubmitted;
  final Color borderColorTop;
  final Color borderColorBottom;
  final Color borderColorLeft;
  final Color borderColorRight;
  final double borderWidthTop;
  final double borderWidthBottom;
  final double borderWidthLeft;
  final double borderWidthRight;
  TextWidgetForm({
    Key? key,
    required this.formControl,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.onFieldSubmitted,
    this.borderColorTop = Colors.transparent,
    this.borderColorBottom = Colors.transparent,
    this.borderColorLeft = Colors.transparent,
    this.borderColorRight = Colors.transparent,
    this.borderWidthTop = 0.0,
    this.borderWidthBottom = 0.0,
    this.borderWidthLeft = 0.0,
    this.borderWidthRight = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ReactiveTextField<String>(
        formControl: formControl,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          hintText: hintText,
        ),
        keyboardType: keyboardType,
        onSubmitted: (value) {
          if (onFieldSubmitted != null) {
            onFieldSubmitted!(formControl);
          }
        },
        validationMessages: {
          ValidationMessage.required: (control) => 'This field is required',
        },
      ),
    );
  }
}

class WidgetForm extends StatelessWidget {
  final String? formControlName;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(AbstractControl<dynamic>)? validator;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;

  // Adding border customization properties
  final Color borderColorTop;
  final Color borderColorBottom;
  final Color borderColorLeft;
  final Color borderColorRight;
  final double borderWidthTop;
  final double borderWidthBottom;
  final double borderWidthLeft;
  final double borderWidthRight;

  const WidgetForm({
    super.key,
    required this.formControlName,
    this.hintText,
    this.keyboardType,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,

    // Default border values
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
      child: ReactiveTextField(
        formControlName: formControlName!,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onSubmitted: onFieldSubmitted != null
            ? (control) => onFieldSubmitted!(control.value)
            : null,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          hintText: hintText,
          // hintStyle: const TextStyle(color: Colors.grey),
          // labelStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
