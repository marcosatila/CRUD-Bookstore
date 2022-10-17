import 'package:crud_http_request/views/forms/search_book.dart';
import 'package:crud_http_request/views/views_book/detail_book.dart';
import 'package:flutter/material.dart';
import '../../api_controllers/api_service.dart';
import '../../models/book_model.dart';

class ListBook extends StatefulWidget {
  const ListBook({Key? key}) : super(key: key);

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  ApiService getBooks = ApiService();


  @override
  void initState() {
    super.initState();
    getBooks.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 47, 61),
        // automaticallyImplyLeading: false,
        // title: const Text('Lista de Livros'),
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
                  MaterialPageRoute(builder: (context) => const SearchBook()));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child:  Text(
              'Lista de Livros',
              style: TextStyle(fontSize: 34),
            ),
          ),
          Expanded(child: futureList()),
        ],
      ),
      drawer:  const CustomDrawer(),
    );
  }

  FutureBuilder<List<Book>> futureList() {
    return FutureBuilder<List<Book>>(
      future: getBooks.getBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Algo errado: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.hasData) {
          return DetailBookList(books: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ListTile(
              leading: Image.network(
                'https://cdn-icons-png.flaticon.com/512/2170/2170077.png',
                width: 38,
                height: 38,
              ),
              title: const Text('Entrar'),
              onTap: () {
                Navigator.pushNamed(context, "/LoginPage");
              },
            ),ListTile(
              leading: Image.network(
                'https://cdn-icons-png.flaticon.com/512/1164/1164620.png',
                width: 38,
                height: 38,
              ),
              title: const Text('Lista de Livros'),
              onTap: () {
                Navigator.pushNamed(context, "/ListBook");
              },
            ),
            divider(),
            ListTile(
              leading: Image.network(
                'https://cdn-icons-png.flaticon.com/512/3672/3672912.png',
                width: 38,
                height: 38,
              ),
              title: const Text('Cadastrar Novo Livro'),
              onTap: () {
                Navigator.pushNamed(context, "/CreateForm");
              },
            ),
            divider(),
            ListTile(
              leading: Image.network(
                'https://cdn-icons-png.flaticon.com/512/2267/2267651.png',
                width: 38,
                height: 38,
              ),
              title: const Text('Lista de Autores'),
              onTap: () {
                Navigator.pushNamed(context, '/ListAuthor');
              },
            ),
            divider(),
            ListTile(
              leading: Image.network(
                'https://cdn-icons-png.flaticon.com/512/1750/1750109.png',
                width: 38,
                height: 38,
              ),
              title: const Text('Pesquisar por Livro'),
              onTap: () {
                Navigator.pushNamed(context, '/SearchBook');
              },
            ),
            ListTile(
              leading: Image.network(
                'https://cdn-icons-png.flaticon.com/512/3798/3798318.png',
                width: 38,
                height: 38,
              ),
              title: const Text('Sair'),
              onTap: () async {
                  Navigator.popAndPushNamed(context, '/LoginPage');
                // Navigator.pushNamed(context, '/SearchBook');
              },
            ),
          ],
        ),
      ),
    );
  }

  Divider divider() {
    return const Divider(
      height: 14,
      thickness: 0.0,
      color: Colors.transparent,
    );
  }
}
