import 'package:flutter/material.dart';

import 'package:management_app/screens/home_screen.dart';
import 'package:management_app/screens/contact.dart';
import 'package:management_app/screens/app.dart';
import 'package:management_app/screens/calendar.dart';
import 'package:management_app/screens/noti_center.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen();

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ContactScreen(),
    AppScreen(),
    CalenderScreen(),
    NotiCenterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(65, 83, 193, 1),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(FontAwesomeIcons.home),
              ),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(FontAwesomeIcons.solidAddressBook)),
                label: "Danh bạ"),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(FontAwesomeIcons.th),
              ),
              label: "Ứng dụng",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(FontAwesomeIcons.solidCalendar),
              ),
              label: "Lịch",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(FontAwesomeIcons.solidBell),
              ),
              label: "Thông báo",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) => setState(() => _selectedIndex = index)),
    );
  }
}
