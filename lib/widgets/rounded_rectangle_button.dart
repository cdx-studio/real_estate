import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  RoundedRectangleButton({
    this.height,
    this.width,
    this.child,
    this.color,
    this.onPressed,
    this.borderRadius,
  });
  final double height;
  final double width;
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
