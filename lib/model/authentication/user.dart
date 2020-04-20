class User {
  String firstname;
  String lastname;
  String mobile;
  String password;
  String email;
  String c_password;

  User({this.firstname,
    this.lastname,
    this.mobile,
    this.password,
    this.email,
    this.c_password});

  Map<String, dynamic> toJason() {
    return {
      'firstName': firstname,
      'lastName': lastname,
      'phoneNumber': mobile,
      'password': password,
      'email': email,
      'cPassword': c_password,

    };
  }
}

