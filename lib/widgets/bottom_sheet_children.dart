import 'package:flutter/material.dart';

class BottomSheetChildren extends StatefulWidget {
  @override
  _BottomSheetChildrenState createState() => _BottomSheetChildrenState();
}

class _BottomSheetChildrenState extends State<BottomSheetChildren> {
  int _selectedIndex = 0;

  List<BottomSheetItem> _items = [
    BottomSheetItem(
      title: 'School',
      icon: Icons.school,
      color: Colors.blue,
    ),
    BottomSheetItem(
      title: 'Restaurants',
      icon: Icons.restaurant,
      color: Colors.red,
    ),
    BottomSheetItem(
      title: 'Metro',
      icon: Icons.train,
      color: Colors.deepPurple,
    ),
    BottomSheetItem(
      title: 'Shopping',
      icon: Icons.shopping_basket,
      color: Colors.yellow[700],
    ),
    BottomSheetItem(
      title: 'Parks',
      icon: Icons.notifications,
      color: Colors.cyan,
    ),
  ];

  Widget _buildItems(BottomSheetItem item, bool isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 42.0,
          width: 42.0,
          decoration: BoxDecoration(
              color: isSelected ? item.color : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(1.0, 3.0),
                  blurRadius: 6.0,
                  spreadRadius: 6.0,
                ),
              ]),
          child: Center(
            child: Icon(
              item.icon,
              color: isSelected ? Colors.white : item.color,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          item.title,
          style: TextStyle(
            fontSize: isSelected ? 16.0 : 15.0,
            color: isSelected ? Colors.black : Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 10.0),
          Center(
            child: Text(
              'Near By',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.map(
              (item) {
                var _itemIndex = _items.indexOf(item);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = _itemIndex;
                    });
                  },
                  child: _buildItems(item, _selectedIndex == _itemIndex),
                );
              },
            ).toList(),
          ),
          SizedBox(height: 25.0),
          Text(
            'Primary Schools',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          _primarySchoolList(),
          SizedBox(height: 16.0),
          Text(
            'Secondary Schools',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          _secondarySchoolList(),
        ],
      ),
    );
  }

  List<SchoolItem> _primarySchools = [
    SchoolItem(name: 'Canyon Crest Academy', distance: '0.38 miles'),
    SchoolItem(name: 'Pala Alta Primary School', distance: '1.09 miles'),
    SchoolItem(name: 'Fullertan Joint Union School', distance: '0.98 miles'),
    SchoolItem(name: 'San Marina Unified School', distance: '2.76 miles'),
  ];
  List<SchoolItem> _secondarySchools = [
    SchoolItem(name: 'Whitney High School', distance: '0.79 miles'),
    SchoolItem(name: 'KIPP San Jose Collegiate', distance: '3.07 miles'),
    SchoolItem(name: 'Roseland Charter School', distance: '0.78 miles'),
    SchoolItem(name: 'Stackton Unified Academy', distance: '0.39 miles'),
  ];

  Widget _buildScoolItem(SchoolItem item) {
    return ListTile(
      leading: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(Icons.school, color: Colors.grey[900]),
        ),
      ),
      title: Text(
        item.name,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[800],
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        item.distance,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _primarySchoolList() {
    return Column(
      children: _primarySchools
          .map(
            (item) => _buildScoolItem(item),
          )
          .toList(),
    );
  }

  Widget _secondarySchoolList() {
    return Column(
      children: _secondarySchools
          .map(
            (item) => _buildScoolItem(item),
          )
          .toList(),
    );
  }
}

class BottomSheetItem {
  BottomSheetItem({this.title, this.icon, this.color});
  final String title;
  final IconData icon;
  final Color color;
}

class SchoolItem {
  SchoolItem({this.name, this.distance});
  final String name;
  final String distance;
}
