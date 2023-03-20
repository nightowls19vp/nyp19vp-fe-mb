import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nyp19vp_mb/login/respository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _authRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
