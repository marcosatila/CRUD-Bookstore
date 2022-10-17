import 'package:crud_http_request/api_controllers/api_service.dart';
import 'package:crud_http_request/views/views_book/home_page.dart';
import 'package:flutter/material.dart';
import '../../models/book_model.dart';

class EditBookForm extends StatefulWidget {
  const EditBookForm({Key? key, required this.user}) : super(key: key);
  final Book user;

  @override
  State<EditBookForm> createState() => _EditBookFormState();
}

class _EditBookFormState extends State<EditBookForm> {
  ApiService api = ApiService();

  late final TextEditingController _titleController =
      TextEditingController(text: widget.user.nameProduct);
  late final TextEditingController _priceController =
      TextEditingController(text: widget.user.price);
  late final TextEditingController _pagesController =
      TextEditingController(text: widget.user.pages);
  late final TextEditingController _authorController =
      TextEditingController(text: widget.user.nameAuthor);
  late final TextEditingController _publisherController =
      TextEditingController(text: widget.user.namePublisher);

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
                'Alterar Livro',
                style: TextStyle(fontSize: 34),
              ),
              TextFormField(
                controller: _titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Título:',
                ),
                textInputAction: TextInputAction.next,
                // onFieldSubmitted: (_) => _submitForm(),
                onSaved: (title) => _titleController.text = title!,
                validator: (title) {
                  if (title == null || title.isEmpty || title.length < 3) {
                    return 'Este campo é obrigatório!';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      // maxLines: 3,
                      // maxLength: 400,
                      decoration: const InputDecoration(
                        labelText: 'Preço:',
                      ),
                      // onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (price) => _priceController.text = price!,
                      validator: (price) {
                        if (price == null || price.isEmpty) {
                          return 'Este campo é obrigatório!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Divider(
                    // thickness: 2,
                    indent: 22,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _pagesController,
                      // inputFormatters: <TextInputFormatter>[
                      //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // ],
                      keyboardType: TextInputType.number,
                      // maxLines: 3,
                      // maxLength: 400,
                      decoration: const InputDecoration(
                        labelText: 'Páginas:',
                      ),
                      // onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (pages) => _pagesController.text = pages!,
                      validator: (pages) {
                        if (pages == null || pages.isEmpty) {
                          return 'Este campo é obrigatório!';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                autofocus: false,
                readOnly: true,
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
              TextFormField(
                readOnly: true,
                controller: _publisherController,
                keyboardType: TextInputType.text,
                // maxLines: 3,
                // maxLength: 400,
                decoration: const InputDecoration(
                  labelText: 'Editora:',
                ),
                // onFieldSubmitted: (_) => _submitForm(),
                onSaved: (publisher) => _publisherController.text = publisher!,
                validator: (publisher) {
                  if (publisher == null || publisher.isEmpty) {
                    return 'Este campo é obrigatório!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
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
                      api.updateBook(
                        widget.user.id,
                        _titleController.text,
                        _priceController.text,
                        _pagesController.text,
                        _authorController.text,
                        _publisherController.text,
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
