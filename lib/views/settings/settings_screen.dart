import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/widgets/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: AppColors.bgSecondary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Khác',
                  style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.bgPrimary,
                  // border: Border.all(color: AppColors.orange),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                SettingItem(title: "Thông tin ứng dụng"),
                SettingItem(title: "Chính sách và quyền"),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Divider(
              thickness: 1.0,
              color: AppColors.textSecondary,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Expanded(
              child: InkWell(
                onTap: () {
                  print("log out");
                },
                // borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: (screenWidth - 20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Đăng xuất',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
