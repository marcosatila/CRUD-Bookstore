// import 'package:crud_http_request/api_controllers/login_service.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   LoginService api = LoginService();
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     api.verificarToken().then((value) {
//       if(value){
//         Navigator.pushReplacementNamed(context, '/ListBook');
//       } else {
//         if(value){
//           Navigator.pushReplacementNamed(context, '/LoginPage');
//         }
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     // child: Image.asset('images/learning.png'),
//                     height: 150,
//                     width: double.infinity,
//                     child: Image.asset('images/book.png'),
//                   ),
//                   const SizedBox(
//                     height: 90,
//                   ),
//                   TextFormField(
//                     controller: _emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(
//                       labelText: 'E-mail',
//                       contentPadding: EdgeInsets.all(15),
//                       suffixIcon: Icon(Icons.email),
//                     ),
//                     onSaved: (email) => _emailController.text = email!,
//                     validator: (email) {
//                       if (email == null || email.isEmpty) {
//                         return 'Este campo é obrigatório!';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: const InputDecoration(
//                       labelText: 'Senha',
//                       contentPadding: EdgeInsets.all(15),
//                       suffixIcon: Icon(Icons.key),
//                     ),
//                     obscureText: true,
//                     onSaved: (password) => _passwordController.text = password!,
//                     validator: (password) {
//                       if (password == null || password.isEmpty) {
//                         return 'A senha digitada está errada!';
//                       } else if(password.length <= 5){
//                         return 'A senha é muito curta!';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 17, 47, 61),
//                         elevation: 10,
//                       ),
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save();
//                           api.verificarToken();
//                           api.loginUser(
//                             _emailController.text,
//                             _passwordController.text,
//                           );
//                         }
//
//                         Navigator.pushReplacementNamed(context, '/ListBook');
//                         // Navigator.pushReplacement(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => const HomePage(),
//                         //   ),
//                         // );
//
//                       },
//                       child: const Text(
//                         'Entrar',
//                         style: TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xffffffff),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: TextButton(
//                             // style: const ButtonStyle(backgroundColor: Color.red),
//                             child: const Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text('Cadastre-se')),
//                             onPressed: () {},
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: TextButton(
//                             child: const Align(
//                                 alignment: Alignment.centerRight,
//                                 child: Text('Esqueci a Senha')),
//                             onPressed: () {},
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
