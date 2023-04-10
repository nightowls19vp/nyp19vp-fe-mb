import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/state/nav_bar_state.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class CustomDrawerNavigation extends StatelessWidget {
  const CustomDrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarState = Provider.of<NavigationBarState>(context);
    void _onItemTapped(int index) {
      navBarState.updateCurrentIndex(index);
      navBarState.widgetOption(navBarState.currentIndex);
      Navigator.pop(context);
    }

    return Drawer(
      backgroundColor: AppColors.bgPrimary,
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
                      backgroundColor: AppColors.bgPrimary,
                      backgroundImage: AssetImage('assets/images/owl.png'),

                      // backgroundImage:
                      //     NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Hồ Ngọc Minh Châu',
                      style:
                          TextStyle(fontSize: 20, color: AppColors.bgPrimary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text(
              'Trang chủ',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.text,
              ),
            ),
            selectedColor: AppColors.orange,
            onTap: () {
              _onItemTapped(2);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text(
              'Trang cá nhân',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.text,
              ),
            ),
            onTap: () {
              _onItemTapped(3);
            },
          ),
          ListTile(
            leading: Icon(Icons.store_rounded),
            title: const Text(
              'Quản lý kho',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.text,
              ),
            ),
            onTap: () {
              _onItemTapped(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add_rounded),
            title: const Text(
              'Quản lý gói',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.text,
              ),
            ),
            onTap: () {
              _onItemTapped(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text(
              'Cài đặt',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.text,
              ),
            ),
            onTap: () {
              _onItemTapped(4);
            },
          ),
        ],
      ),
    );
  }
}
