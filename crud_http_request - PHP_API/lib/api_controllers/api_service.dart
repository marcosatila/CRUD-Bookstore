import 'dart:convert';
import 'package:crud_http_request/models/book_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // String url = 'https://parseapi.back4app.com/classes/books';


  //url via localhost
  String url = 'http://localhost/bookstore-api-crud/public/api/books';
  String urlAuthor = 'http://localhost/bookstore-api-crud/public/api/authors';
  String urlPublisher = 'http://localhost/bookstore-api-crud/public/api/publisher';
  String urlSearch = 'http://localhost/bookstore-api-crud/public/api/books/search';

  //url api via ngrok
  // String url = 'https://4c36-2804-3678-3068-9e00-8028-b3e8-8ed5-bf9c.ngrok.io/bookstore-api-crud/public/api/books';
  // String urlAuthor = 'https://4c36-2804-3678-3068-9e00-8028-b3e8-8ed5-bf9c.ngrok.io/bookstore-api-crud/public/api/authors';
  // String urlSearch =
  //     'https://4c36-2804-3678-3068-9e00-8028-b3e8-8ed5-bf9c.ngrok.io/bookstore-api-crud/public/api/books/search';

  Future<List<Book>> searchBook(nameProduct) async {
    var response = await http.get(
      Uri.parse('$urlSearch/$nameProduct'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List body = json.decode(response.body)["data"];
      if (kDebugMode) {
        print(body);
      }
      List<Book> user = body.map((json) => Book.fromJson(json)).toList();

      return user;
    } else {
      throw Exception("Falha ao carregar dados!");
    }
  }

  Future<List<Book>> getBooks() async {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List body = json.decode(response.body)["data"];
      if (kDebugMode) {
        print(body);
      }
      List<Book> user = body.map((json) => Book.fromJson(json)).toList();

      return user;
    } else {
      throw Exception("Falha ao carregar dados!");
    }
  }

  Future<Book> createBook(String nameProduct, String price, String pages,
      String nameAuthor, String namePublisher) async {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name_product': nameProduct,
        'pages': pages,
        'price': price,
        'name_author': nameAuthor,
        'name_publisher': namePublisher,
      }),
    );

    if (response.statusCode == 201) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Dados não foram salvos');
    }
  }

  Future<Book> deleteBook(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$url/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Não foi possível deletar Usuário');
    }
  }

  Future<Book> updateBook(String id, String nameProduct, String price,
      String pages, String nameAuthor, String namePublisher) async {
    final http.Response response = await http.patch(
      Uri.parse('$url/$id'),
      headers: {
        'Content-Type': 'application/json',
        // 'Accept-Patch': 'application/merge-patch+json',
      },
      body: jsonEncode({
        'name_product': nameProduct,
        'pages': pages,
        'price': price,
        'name_author': nameAuthor,
        'name_publisher': namePublisher,
      }),
    );

    if (response.statusCode == 201) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Dados não foram salvos');
    }
  }

  Future<Book> updateAuthor(String id, String nameAuthor) async {
    final http.Response response = await http.patch(
      Uri.parse('$urlAuthor/$id'),
      headers: {
        'Content-Type': 'application/json',
        // 'Accept-Patch': 'application/merge-patch+json',
      },
      body: jsonEncode({
        'name_author': nameAuthor,
      }),
    );

    if (response.statusCode == 201) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Dados não foram salvos');
    }
  }
}
