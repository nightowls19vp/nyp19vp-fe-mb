import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/colors.dart';
import '../state/nav_bar_state.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final navBarState = Provider.of<NavigationBarState>(context);

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_rounded),
          label: navBarState.labelList[0],
          // backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trolley),
          label: navBarState.labelList[1],
          // backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: navBarState.labelList[2],
          // backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: navBarState.labelList[3],
          // backgroundColor: Colors.pink,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: navBarState.labelList[4],
          // backgroundColor: Colors.pink,
        ),
      ],
      currentIndex: navBarState.currentIndex,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.text,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        navBarState.updateCurrentIndex(index);
      },
    );
  }
}
