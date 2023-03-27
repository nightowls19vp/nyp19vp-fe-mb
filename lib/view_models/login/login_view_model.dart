import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/login_response_model.dart';
import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

class LoginViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loginLoading = false;
  bool get loading => _loginLoading;

  setLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  Future<dynamic> loginApi(dynamic data, BuildContext context) async {
    // setLoading(true);

    dynamic response = await _authRepo.loginApi(data);

    Map<String, dynamic> eventMap = response;
    var loginResponse = LoginResponseModel.fromJson(eventMap);

    return loginResponse;
  }
}
