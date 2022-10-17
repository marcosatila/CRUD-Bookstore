import 'package:crud_http_request/api_controllers/api_service.dart';
import 'package:crud_http_request/views/views_book/home_page.dart';
import 'package:flutter/material.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({Key? key}) : super(key: key);

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  ApiService api = ApiService();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _pagesController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        backgroundColor: const Color.fromARGB(255, 17, 47, 61),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cadastrar Novo Livro',
                style: TextStyle(fontSize: 34),
              ),
              TextFormField(
                controller: _titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Título:',
                  focusColor: Color.fromARGB(255, 17, 47, 61),
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
                    elevation: 8,
                    backgroundColor: const Color.fromARGB(255, 17, 47, 61),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      api.createBook(
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
                    }
                  },
                  child: const Text(
                    'Salvar',
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
