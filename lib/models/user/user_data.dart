class UserData {
  String name;
  String email;
  String password;

  UserData({
    this.name,
    this.email,
    this.password,
  });

  Map<String, dynamic> toVariables() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
