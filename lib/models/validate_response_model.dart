class ValidateResponseModel {
  int statusCode;
  String message;
  dynamic user;

  ValidateResponseModel(
      {required this.statusCode, required this.message, this.user});

  ValidateResponseModel.fromJson(Map<String, dynamic> json)
      : statusCode = json["statusCode"],
        message = json["message"],
        user = json["user"];

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
