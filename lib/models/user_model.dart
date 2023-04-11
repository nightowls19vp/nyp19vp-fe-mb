class UserModel {
  String? id;
  String? name;
  String? dob;
  String? email;
  String? phone;
  String? avatar;

  UserModel(
      {this.id, this.name, this.dob, this.email, this.phone, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        name = json["name"],
        dob = json["dob"],
        email = json["email"],
        phone = json["phone"],
        avatar = json["avatar"];

  @override
  String toString() {
    // TODO: implement toString
    return "id: ${id}, name: ${name}, dob: ${dob}, email: ${email}, phone: ${phone}, avatar: ${avatar},";
  }
}
