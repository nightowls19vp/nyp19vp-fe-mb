import 'package:flutter/material.dart';

class NavigationBarState extends ChangeNotifier {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  void updateCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
