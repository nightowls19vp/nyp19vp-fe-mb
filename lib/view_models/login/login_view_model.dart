import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/constants/status_type.dart';
import 'package:nyp19vp_mb/utils/flush_bar.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';

import '../../models/auth_response_model.dart';
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
    var loginResponse = AuthResponseModel.fromJson(eventMap);
    switch (loginResponse.statusCode) {
      case 200:
        await showCustomizeFlushbar(
            StatusType.success, 'Đăng nhập thành công', context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.home,
          (route) => false,
        );
        break;
      case 401:
        await showCustomizeFlushbar(
            StatusType.fail, 'Mật khẩu không đúng', context);
        break;
      case 404:
        await showCustomizeFlushbar(
            StatusType.fail, 'Tài khoản không tồn tại', context);
        break;
      default:
    }

    return loginResponse;
  }
}
