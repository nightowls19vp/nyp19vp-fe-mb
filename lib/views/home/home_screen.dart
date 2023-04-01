import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:provider/provider.dart';

import '../../state/nav_bar_state.dart';
import '../../widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
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
    final navBarState = Provider.of<NavigationBarState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Megoo',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.primary,
          ),
        ),
        leadingWidth: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(navBarState.currentIndex),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
