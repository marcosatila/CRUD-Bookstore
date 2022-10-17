import 'package:crud_http_request/api_controllers/api_service.dart';
import 'package:crud_http_request/views/forms/form_book_edit.dart';
import 'package:crud_http_request/views/views_book/home_page.dart';
import 'package:flutter/material.dart';
import '../../models/book_model.dart';

// ignore: must_be_immutable
class DetailBookList extends StatefulWidget {
  DetailBookList({Key? key, required this.books}) : super(key: key);

  List<Book> books;

  @override
  State<DetailBookList> createState() => _DetailBookListState();
}

class _DetailBookListState extends State<DetailBookList> {
  Future<List<Book>> getBooks = ApiService().getBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 120,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/29/29302.png',
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Título: ${widget.books[index].nameProduct}',
                          ),
                          Text(
                            'Preço: R\$ ${widget.books[index].price}',
                          ),
                          Text(
                            'Páginas: ${widget.books[index].pages}',
                          ),
                          Text(
                            'Autor: ${widget.books[index].nameAuthor}',
                          ),
                          Text(
                            'Autor: ${widget.books[index].namePublisher}',
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditBookForm(user: widget.books[index]),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit_note),
                          color: Colors.teal,
                        ),
                        IconButton(
                          onPressed: () async {
                            ApiService().deleteBook(widget.books[index].id);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListBook()));
                            // ApiService().getBooks();
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
