import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/models/user_model.dart';

class CurUserState extends ChangeNotifier {
  UserModel? user;
  String? accessToken;
}
