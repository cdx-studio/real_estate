import 'package:flutter/material.dart';
import 'package:realestate/widgets/rounded_rectangle_button.dart';

class TopBarButton extends RoundedRectangleButton {
  TopBarButton({
    double size,
    IconData icon,
    double iconSize: 25.0,
    VoidCallback onPressed,
  }) : super(
          height: size,
          width: size,
          color: Colors.white38,
          borderRadius: 12.0,
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: iconSize,
            ),
          ),
          onPressed: onPressed,
        );
}
