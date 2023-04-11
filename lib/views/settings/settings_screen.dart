import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';
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
                  'Thông báo',
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
                SettingItem(title: "Mua nhu yếu phẩm"),
                SettingItem(title: "Cập nhật trạng thái nhu yếu phẩm"),
                SettingItem(title: "Chương trình khuyến mãi"),
              ]),
            ),
          ),
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
                onTap: () => showDialog<String>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        useMaterial3: true,
                        colorScheme: ColorScheme.light(
                          primary: AppColors.orange, // header background color
                          onPrimary: AppColors.bgPrimary, // header text color
                          onSurface: AppColors.text, // body text color
                        ),
                      ),
                      child: AlertDialog(
                        surfaceTintColor: AppColors.bgPrimary,
                        title: const Text(
                          'Đăng xuất',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                          ),
                        ),
                        content: const Text(
                          'Đăng xuất khỏi tài khoản của bạn?',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.text,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.orange,
                            ),
                            onPressed: () => Navigator.pop(context, 'Huỷ'),
                            child: const Text(
                              'Huỷ',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.text,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.orange,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, RoutesName.login);
                              print("logout");
                              // Navigator.pop(context, 'Đăng xuất');
                            },
                            child: const Text(
                              'Đăng xuất',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: (screenWidth - 20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Đăng xuất',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.bgPrimary),
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
