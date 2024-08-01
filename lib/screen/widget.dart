import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String? initialValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final Widget suffixIcon;
  final String? hintText;

  // Border customization properties
  final Color borderColorTop;
  final Color borderColorBottom;
  final Color borderColorLeft;
  final Color borderColorRight;
  final double borderWidthTop;
  final double borderWidthBottom;
  final double borderWidthLeft;
  final double borderWidthRight;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.suffixIcon,
    this.initialValue,

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
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    assert(
      widget.items.toSet().length == widget.items.length,
      'Duplicate items found in the list',
    );
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: widget.borderColorTop,
            width: widget.borderWidthTop,
          ),
          bottom: BorderSide(
            color: widget.borderColorBottom,
            width: widget.borderWidthBottom,
          ),
          left: BorderSide(
            color: widget.borderColorLeft,
            width: widget.borderWidthLeft,
          ),
          right: BorderSide(
            color: widget.borderColorRight,
            width: widget.borderWidthRight,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          isExpanded: true,
          autofocus: true,
          focusColor: Colors.transparent,
          value: _selectedValue,
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            widget.onChanged(newValue);
          },
          icon: widget.suffixIcon,
          hint: Text(widget.hintText ?? 'Select an item'),
        ),
      ),
    );
  }
}
