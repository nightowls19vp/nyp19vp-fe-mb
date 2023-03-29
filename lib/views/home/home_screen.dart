import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Trang chủ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
