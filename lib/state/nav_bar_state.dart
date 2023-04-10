import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/views/profile/profile_screen.dart';
import 'package:nyp19vp_mb/views/settings/settings_screen.dart';

class NavigationBarState extends ChangeNotifier {
  int _currentIndex = 2;

  var labelList = ['Quản lí gói', 'Quản lí kho', 'Trang chủ', 'Tôi', 'Cài đặt'];

  int get currentIndex => _currentIndex;

  Widget widgetOption(_currentIndex) {
    switch (_currentIndex) {
      case 0:
        return Container(
          child: Text('Quản lí gói'),
        );
      case 1:
        return Container(
          child: Text('Quản lí kho'),
        );
      case 2:
        return Container(
          child: Text('Trang chủ'),
        );
      case 3:
        return ProfileScreen();
      case 4:
        return SettingsScreen();
      default:
        return Container(
          child: Text('Lỗi'),
        );
    }
  }

  void updateCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
