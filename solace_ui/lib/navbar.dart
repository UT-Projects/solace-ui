import 'package:flutter/material.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

import 'find_doctor_screen.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  String appBarTitle = "Find a Doctor";

  List<Widget> _widgets = <Widget>[
    FindDoctorScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0)
        appBarTitle = "Find a Doctor";
      else if (index == 1)
        appBarTitle = "Messages";
      else if (index == 2)
        appBarTitle = "Profile";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(appBarTitle),
      ),
      body: _widgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.coronavirus_sharp), label: "Doctor"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
