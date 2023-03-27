import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../models/login_response_model.dart';
import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

class RegisterViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  Future<dynamic> registerApi(dynamic data, BuildContext context) async {
    dynamic response = await _authRepo.registerApi(data);

    if (kDebugMode) {
      Map<String, dynamic> eventMap = response;
      var loginResponse = LoginResponseModel.fromJson(eventMap);
      print(loginResponse.statusCode);
      return loginResponse;
      // show_Custom_Flushbar('Đăng nhập thành công', context);
    }
  }
}
