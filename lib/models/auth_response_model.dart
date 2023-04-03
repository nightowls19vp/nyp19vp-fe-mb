class AuthResponseModel {
  int statusCode;
  String message;
  String? accessToken;
  String? refreshToken;

  AuthResponseModel(
      {required this.statusCode,
      required this.message,
      this.accessToken,
      this.refreshToken});

  int get getStatusCode {
    return statusCode;
  }

  String get getMessage {
    return message;
  }

  AuthResponseModel.fromJson(Map<String, dynamic> json)
      : statusCode = json["statusCode"],
        message = json["message"],
        accessToken = json["accessToken"],
        refreshToken = json["refreshToken"];

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
