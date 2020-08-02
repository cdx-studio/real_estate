import 'package:flutter/material.dart';
import 'package:realestate/widgets/rounded_rectangle_button.dart';

class OptionButton extends RoundedRectangleButton {
  OptionButton({
    double size,
    IconData icon,
    double iconSize: 25.0,
    VoidCallback onPressed,
  }) : super(
          height: size,
          width: size,
          color: Colors.grey[300],
          borderRadius: 12.0,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.grey[900],
                  size: iconSize,
                ),
              ],
            ),
          ),
          onPressed: onPressed,
        );
}
