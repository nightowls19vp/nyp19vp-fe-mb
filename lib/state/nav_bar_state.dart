import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/views/profile/profile_screen.dart';

class NavigationBarState extends ChangeNotifier {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  Widget wigetOption(_currentIndex) {
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
        return Container(
          child: Text('Cài đặt'),
        );
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
