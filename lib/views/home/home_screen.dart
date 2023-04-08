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
        backgroundColor: AppColors.orange,
        title: Text(
          'Megoo',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 280,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.orange,
                ),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: AppColors.white,
                        backgroundImage: AssetImage('assets/images/owl.png'),

                        // backgroundImage:
                        //     NetworkImage('https://via.placeholder.com/150'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Hồ Ngọc Minh Châu',
                        style: TextStyle(fontSize: 20, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: navBarState.wigetOption(navBarState.currentIndex),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
