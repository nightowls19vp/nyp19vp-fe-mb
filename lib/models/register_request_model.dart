class RegisterRequestModel {
  String username;
  String password;
  String name;
  String phone;
  String email;
  String dob;

  RegisterRequestModel({
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.email,
    required this.dob,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "name": name,
        "phone": phone,
        "email": email,
        "dob": dob,
      };
}
