import 'package:crud_http_request/views/forms/create_form.dart';
import 'package:crud_http_request/views/forms/search_book.dart';
import 'package:crud_http_request/views/views_book/detail_author.dart';
import 'package:crud_http_request/views/views_book/detail_book.dart';

import 'package:flutter/material.dart';

import '../../api_controllers/api_service.dart';
import '../../models/book_model.dart';

class ListAuthors extends StatefulWidget {
  const ListAuthors({Key? key}) : super(key: key);

  @override
  State<ListAuthors> createState() => _ListAuthors();
}

class _ListAuthors extends State<ListAuthors> {
  ApiService getBooks = ApiService();

  @override
  void initState() {
    super.initState();
    getBooks.getBooks();
  }
// Future<void> _refreshProducts(){
//     return getBooks.getBooks();
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 47, 61),
        automaticallyImplyLeading: true,
        // title: const Text('Lista de Autores'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                getBooks.getBooks();
              });
            },
            icon: const Icon(Icons.update),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateForm()));
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchBook()));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  DetailAuthorList(authors: [],)));
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(18,10,0,0),
            child: Text('Lista de Autores', style: TextStyle(fontSize: 34),),
          ),
          Expanded(child: futureListAuthors(),),
        ],
      ),
      // drawer: const AppDrawer(),
    );
  }

  FutureBuilder<List<Book>> futureListAuthors() {
    return FutureBuilder<List<Book>>(
      future: getBooks.getBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Algo errado: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.hasData) {
          return DetailAuthorList(authors: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
