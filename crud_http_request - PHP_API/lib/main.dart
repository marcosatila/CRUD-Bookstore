import 'package:crud_http_request/views/forms/create_form.dart';
import 'package:crud_http_request/views/forms/search_book.dart';
import 'package:crud_http_request/views/views_book/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/login_screen/login_page.dart';
import 'views/views_book/list_authors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        focusColor: const Color.fromARGB(255, 17, 47, 61),
        // primarySwatch: Colors.blue,
      ),
      // home: const ListBook(),
      //   home: const ListAuthors(),
      // initialRoute: '/LoginPage',
      initialRoute: '/ListBook',
      routes: {
        // '/LoginPage': (context) => LoginPage(),
        '/ListBook': (context) => const ListBook(),
        '/CreateForm': (context) => const CreateForm(),
        '/ListAuthor': (context) => const ListAuthors(),
        '/SearchBook': (context) => const SearchBook(),
      },
    );
  }
}
