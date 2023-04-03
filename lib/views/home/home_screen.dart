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
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: navBarState.wigetOption(navBarState.currentIndex),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
