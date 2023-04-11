import 'package:nyp19vp_mb/models/user_model.dart';

class ValidateResponseModel {
  int statusCode;
  String message;
  UserModel? user;

  ValidateResponseModel(
      {required this.statusCode, required this.message, this.user});

  ValidateResponseModel.fromJson(Map<String, dynamic> json)
      : statusCode = json["statusCode"],
        message = json["message"],
        user = json["user"] != null ? UserModel.fromJson(json["user"]) : null;

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
