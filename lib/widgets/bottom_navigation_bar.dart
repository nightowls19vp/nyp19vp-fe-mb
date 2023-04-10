import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store_rounded),
          label: navBarState.labelList[1],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: navBarState.labelList[2],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: navBarState.labelList[3],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: navBarState.labelList[4],
        ),
      ],
      currentIndex: navBarState.currentIndex,
      backgroundColor: AppColors.bgPrimary,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.text,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        navBarState.updateCurrentIndex(index);
      },
    );
  }
}
