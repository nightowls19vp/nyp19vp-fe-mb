import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/models/auth_response_model.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/widgets/drawer_navigation.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.orange,
        title: Text(
          'Megoo',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.bgPrimary,
          ),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              color: AppColors.bgPrimary,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: CustomDrawerNavigation(),
      body: Center(
        child: navBarState.widgetOption(navBarState.currentIndex),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
