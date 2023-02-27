class RegisterData {
  String? LastName;
  String? FirstName;
  String? phonenumber;
  String? password;
  String? ren_Password;
  RegisterData(
      {required this.FirstName,
      required this.LastName,
      required this.password,
      required this.phonenumber,
      required this.ren_Password});
  factory RegisterData.fromMap(Map map)

  //romJSON(Map<String, dynamic> json)
  {
    return RegisterData(
        FirstName: map['FirstName'],
        LastName: map['LastName'],
        password: map['password'],
        phonenumber: map['phonenumber'],
        ren_Password: map['ren_password']);
    // return
    //  RegisterData(map['FirstName'], map['LastName'], map['password'],
    //     map['phonenumber'], map['ren_password']);

    // FirstName: json['FirstName'],
    // LastName: json['LastName'],
    // password: json['password'],
    // phonenumber: json['phonenumber'],
    // ren_Password: json['ren_password']);
  }
  Map<String, dynamic> toMap() {
    return {
      'FirstName': FirstName,
      'LastName': LastName,
      'phonenumber': phonenumber,
      'password': password,
      'ren_password': ren_Password
    };
  }
}

class login {
  String? pnone;
  String? password;
  login({required this.password, required this.pnone});
  factory login.fromMap(Map map) {
    return login(password: map['password'], pnone: map['phone']);
  }
  Map<String, dynamic> toMap() {
    return {'password': password, 'phone': pnone};
  }
}

class images {
  String? image;
  images({required this.image});
  factory images.fromMap(Map map) {
    return images(image: map['image']);
  }
  Map<String, dynamic> toMap() {
    return {'image':image};
  }
}

