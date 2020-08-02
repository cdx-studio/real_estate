import 'package:flutter/material.dart';
import 'package:realestate/widgets/facility_buttons.dart';

class HeaderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildFirstChild(),
        SizedBox(height: 6.0),
        _buildTitle(),
        SizedBox(height: 4.0),
        Text(
          '3891 Ranchview, Dr. Richardson, CA',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[800],
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.0),
        Row(
          children: <Widget>[
            FacilityButton(
              title: '2 Beds',
              icon: Icons.weekend,
            ),
            SizedBox(width: 20.0),
            FacilityButton(
              title: '1 Baths',
              icon: Icons.opacity,
            ),
            SizedBox(width: 20.0),
            FacilityButton(
              title: '1560 sqft',
              icon: Icons.border_outer,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFirstChild() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.account_balance,
          color: Colors.deepOrange,
        ),
        SizedBox(width: 5.0),
        Text(
          'Apartment',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.deepOrange,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '1,098 USD',
          style: TextStyle(
            fontSize: 32.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                'Monthly',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
            ),
            SizedBox(width: 8.0),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Yearly',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
            )
          ],
        ),
      ],
    );
  }
}