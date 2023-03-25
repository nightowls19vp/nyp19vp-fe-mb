import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/flush_bar.dart';
import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

class LoginViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  late User _user;
  User get user => _user;

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _authRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
        // show_Custom_Flushbar('Đăng nhập thành công', context);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
