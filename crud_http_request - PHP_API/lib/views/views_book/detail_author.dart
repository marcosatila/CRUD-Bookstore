import 'package:crud_http_request/api_controllers/api_service.dart';
import 'package:crud_http_request/views/forms/form_edit_author.dart';
import 'package:flutter/material.dart';
import '../../models/book_model.dart';

class DetailAuthorList extends StatefulWidget {
  DetailAuthorList({Key? key, required this.authors}) : super(key: key);

  List<Book> authors;

  @override
  State<DetailAuthorList> createState() => _DetailAuthorList();
}

class _DetailAuthorList extends State<DetailAuthorList> {
  Future<List<Book>> getBooks = ApiService().getBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.authors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const VerticalDivider(
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Autor: ${widget.authors[index].nameAuthor}',
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditAuthor(author: widget.authors[index]),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit_note),
                      color: Colors.teal,
                    ),
                    IconButton(
                      onPressed: () async {
                        ApiService().deleteBook(widget.authors[index].id);
                        Navigator.pushReplacementNamed(context, '/ListAuthor');
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
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
