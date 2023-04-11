import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nyp19vp_mb/constants/status_type.dart';
import 'package:nyp19vp_mb/utils/flush_bar.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';

import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

class RegisterViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  Future<dynamic> registerApi(dynamic data, BuildContext context) async {
    dynamic response = await _authRepo.registerApi(data);

    Map<String, dynamic> eventMap = response;
    var requestResponse = AuthResponseModel.fromJson(eventMap);
    print(requestResponse.statusCode);

    switch (requestResponse.statusCode) {
      case 201:
        await showCustomizeFlushbar(
            StatusType.success, 'Đăng ký thành công', context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.login,
          (route) => false,
        );
        break;
      default:
    }

    return requestResponse;
  }
}
