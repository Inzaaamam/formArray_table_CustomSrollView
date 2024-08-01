import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool loading;
  final double textSize;
  final Color borderColor;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.title,
    required this.onPressed,
    this.width = 150.0,
    this.height = 50.0,
    this.loading = false,
    this.textSize = 20.0,
    this.borderColor = Colors.transparent,
    this.borderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: textSize, color: textColor),
                ),
              ),
      ),
    );
  }
}
