import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HoldTextWidget extends StatelessWidget {
  final String? formControlName;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(AbstractControl<dynamic>)? validator;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;

  const HoldTextWidget({
    super.key,
    required this.formControlName,
    this.hintText,
    this.keyboardType,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName!,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onSubmitted: onFieldSubmitted != null
          ? (control) => onFieldSubmitted!(control.value)
          : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),

        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
        hintText: hintText,
        // hintStyle: const TextStyle(color: Colors.grey),
        // labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
