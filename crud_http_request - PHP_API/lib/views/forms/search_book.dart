import 'package:crud_http_request/api_controllers/api_service.dart';
import 'package:crud_http_request/models/book_model.dart';
import 'package:crud_http_request/views/views_book/detail_book.dart';
import 'package:flutter/material.dart';

class SearchBook extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SearchBook();

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  final TextEditingController _controller = TextEditingController();

  ApiService api = ApiService();
  Future<List<Book>>? _futureBook;

  findBookByName() {
    setState(() {
      _futureBook = api.searchBook(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 47, 61),
        // title: const Text('Pesquisar por Livro'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pesquisar por Livro',
                style: TextStyle(fontSize: 34),
              ),
            ),
            buildForm(),
            const SizedBox(),
            Expanded(
              child:
                  (_futureBook == null) ? const SizedBox() : buildFutureBook(),
            ),
          ],
        ),
      ),
    );
  }

  //Formulário para pesquisa de um livro(s)
  Column buildForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
                hintText: 'Pesquise pelo nome de um livro'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 300,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // shadowColor: Colors.red,
              elevation: 8,
              backgroundColor: const Color.fromARGB(255, 17, 47, 61),
            ),
            onPressed: () {
              findBookByName();
            },
            child: const Text(
              'Buscar',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  FutureBuilder<List<Book>> buildFutureBook() {
    return FutureBuilder(
      future: _futureBook,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DetailBookList(books: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
