import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String? initialValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final Widget suffixIcon;
  final double borderRadius;
  final Color borderColor;
  final String? hintText;

  const DropDownWidget({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.suffixIcon,
    this.initialValue,
    this.borderRadius = 4.0,
    this.borderColor = Colors.grey,
  });

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    assert(widget.items.toSet().length == widget.items.length,
        'Duplicate items found in the list');
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
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
