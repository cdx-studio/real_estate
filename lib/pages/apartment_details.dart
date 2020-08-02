import 'package:flutter/material.dart';
import 'package:realestate/widgets/bottom_sheet_children.dart';
import 'package:realestate/widgets/header_tile.dart';
import 'package:realestate/widgets/listing_agent.dart';
import 'package:realestate/widgets/option_button.dart';
import 'package:realestate/widgets/top_bar_button.dart';

class ApartmentDetails extends StatefulWidget {
  @override
  _ApartmentDetailsState createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  Widget topBarActions() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 15.0,
          left: 16.0,
          right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBarButton(
            size: 45.0,
            icon: Icons.arrow_back_ios,
            onPressed: () {},
          ),
          Row(
            children: <Widget>[
              TopBarButton(
                size: 45.0,
                icon: Icons.favorite,
                onPressed: () {},
              ),
              SizedBox(width: 16.0),
              TopBarButton(
                size: 45.0,
                icon: Icons.reply,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<OptionItem> _items = [
    OptionItem(title: 'Map View', icon: Icons.my_location),
    OptionItem(title: 'Near By', icon: Icons.category),
    OptionItem(title: 'Street View', icon: Icons.directions_run),
    OptionItem(title: 'Stats', icon: Icons.donut_large),
  ];

  Widget _buildOptionItem(OptionItem item) {
    return OptionButton(
      size: 45.0,
      icon: item.icon,
      onPressed: () {},
    );
  }

  Widget _buildOptions() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width - 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[700].withOpacity(0.15),
            offset: Offset(0.0, 1.0),
            blurRadius: 10.0,
            spreadRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map(
              (item) => GestureDetector(
                onTap: () {
                  if (_items.indexOf(item) == 1) {
                    _showBottomSheet(context);
                  }
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildOptionItem(item),
                      SizedBox(height: 8.0),
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: _buildStackChild(),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: <Widget>[
                  HeaderTile(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.0, vertical: 8.0),
                    child: Divider(color: Colors.grey[500]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'Are you looking for family friendly neighbourhood with great '
                                  'neighbours, large lot with a creek that runs through the back. ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Show More',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.0, vertical: 8.0),
                    child: Divider(color: Colors.grey[500]),
                  ),
                  Text(
                    'Listing Agent',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ListingAgent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStackChild() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Colors.red,
          margin: EdgeInsets.only(bottom: 50.0),
          child: Image.asset(
            'images/apartment.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0.0,
          child: topBarActions(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildOptions(),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: BottomSheetChildren(),
      ),
    ),
  );
}

class OptionItem {
  OptionItem({this.title, this.icon});
  final String title;
  final IconData icon;
}
