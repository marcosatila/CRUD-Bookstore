// import 'dart:convert';
// import 'package:crud_http_request/models/user_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// // import 'package:crud_http_request/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoginService {
//   String urlLogin = 'http://localhost/bookstore-api-crud/public/api/login';
//
//   Future<User> loginUser(String email, String password) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     final http.Response response = await http.post(
//       Uri.parse(urlLogin),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//       }),
//     );
//     if (kDebugMode) {
//       print(response.body);
//       print(response.statusCode);
//     }
//
//     if (response.statusCode == 201) {
//       return User.fromJson(jsonDecode(response.body)['token']);
//       await sharedPreferences.setString('token', 'Token ${jsonDecode(response.body)['token']}');
//       // print(jsonDecode(response.body)['token']);
//       // return true;
//
//       // String token = jsonDecode(response.body)['token'];
//       // await sharedPreferences.setString('token', 'Token $token');
//     } else {
//       throw Exception('Dados não foram salvos');
//       // jsonDecode(response.body);
//       // return false;
//     }
//   }
//
//   Future<bool> verificarToken() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     if(sharedPreferences.getString('token') != null){
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Future<bool> sair() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.clear();
//     return true;
//   }
//   //Criar método para criar usuário
//
//   //Criar método para recuperar senha
//
//
// }
