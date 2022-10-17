// class User {
//   String id;
//   String email;
//   String password;
//   String token;
//
//   User({
//     required this.id,
//     required this.email,
//     required this.password,
//     required this.token,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json["id"],
//       email: json["email"],
//       password: json["password"],
//       token: json['token'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name_product'] = email;
//     data['pages'] = password;
//     data['token'] = token;
//
//     return data;
//   }
// }
