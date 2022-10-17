import 'package:crud_http_request/api_controllers/api_service.dart';
import 'package:crud_http_request/views/views_book/home_page.dart';
import 'package:flutter/material.dart';
import '../../models/book_model.dart';

// ignore: must_be_immutable
class EditAuthor extends StatefulWidget {
  const EditAuthor({Key? key, required this.author}) : super(key: key);
  final Book author;

  @override
  State<EditAuthor> createState() => _EditAuthorState();
}

class _EditAuthorState extends State<EditAuthor> {
  ApiService api = ApiService();

  late final TextEditingController _authorController =
      TextEditingController(text: widget.author.nameAuthor);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Alterar Livro'),
        backgroundColor: const Color.fromARGB(255, 17, 47, 61),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alterar Autor',
                style: TextStyle(fontSize: 34),
              ),
              TextFormField(
                controller: _authorController,
                keyboardType: TextInputType.text,
                // maxLines: 3,
                // maxLength: 400,
                decoration: const InputDecoration(
                  labelText: 'Autor:',
                ),
                // onFieldSubmitted: (_) => _submitForm(),
                onSaved: (author) => _authorController.text = author!,
                validator: (author) {
                  if (author == null || author.isEmpty) {
                    return 'Este campo é obrigatório!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // shadowColor: Colors.red,
                    backgroundColor: const Color.fromARGB(255, 17, 47, 61),
                    elevation: 8,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      api.updateAuthor(
                        widget.author.authorId,
                        _authorController.text,
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListBook()));
                      // ApiService().getBooks();
                    }
                  },
                  child: const Text(
                    'Alterar',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
