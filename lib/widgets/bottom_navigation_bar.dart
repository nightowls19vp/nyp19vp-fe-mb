import 'package:flutter/material.dart';

import '../res/colors.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Quản lý gói',
      style: optionStyle,
    ),
    Text(
      'Index 1: Quản lý kho',
      style: optionStyle,
    ),
    Text(
      'Index 2: Trang chủ',
      style: optionStyle,
    ),
    Text(
      'Index 3: Tôi',
      style: optionStyle,
    ),
    Text(
      'Index 4: Cái đặt',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_rounded),
          label: 'Quản lý gói',
          // backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trolley),
          label: 'Quản lý kho',
          // backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
          // backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Tôi',
          // backgroundColor: Colors.pink,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Cài đặt',
          // backgroundColor: Colors.pink,
        ),
      ],
      currentIndex: _selectedIndex,
      backgroundColor: AppColors.background,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: AppColors.text,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }
}
