import 'package:flutter/material.dart';
import 'package:realestate/widgets/option_button.dart';

class FacilityButton extends StatelessWidget {
  FacilityButton({this.title, this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OptionButton(
          size: 28.0,
          icon: icon,
          iconSize: 20.0,
          onPressed: () {},
        ),
        SizedBox(width: 5.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
