import 'package:flutter/material.dart';

class ListingAgent extends StatelessWidget {
  ListingAgent({this.name, this.identity, this.imageUrl});
  final String name;
  final String identity;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'images/owner.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Jackal Moren',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Owner',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            _roundButton(
              icon: Icons.message,
              iconColor: Colors.indigo[700],
            ), 
            SizedBox(width: 12.0),
            _roundButton(
              icon: Icons.call,
              iconColor: Colors.grey[700],
            )
          ],
        ),
      ],
    );
  }


  Widget _roundButton({IconData icon, Color iconColor}) {
    return Container(
      height: 38.0,
      width: 38.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500].withOpacity(0.3),
            offset: Offset(2.0, 2.0),
            blurRadius: 10.0,
            spreadRadius: 10.0,
          ),
        ]
      ),
      child: Center(
        child: Icon(
          icon,
          size: 20.0,
          color: iconColor,
        ),
      ),
    );
  }
}
