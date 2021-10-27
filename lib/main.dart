import 'package:flutter/material.dart';
import 'package:login_flutter/add_usuarios.dart';
import 'package:login_flutter/data/DBHelper.dart';

import 'modelos/usuario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Topicos-Crud',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePageMain(),
    );
  }
}

class HomePageMain extends StatefulWidget {
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomePageMain> {
  String title = 'Listar Usuario';
  DBHelper _dbHelper = DBHelper();
  Widget _usuarios = SizedBox();
  MyHomePage() {
    usuarioList(null);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ____) => AddUsuarios(),
              )),
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[_usuarios],
      ),
    );
  }

//
  Container buildItem(Usuario doc) {
    return Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      //
      child: Stack(
        children: [
          card(doc),
        ],
      ),
    );
  }

//Detectar Eventos
  GestureDetector card(Usuario doc) {
    return GestureDetector(
      child: Container(
        height: 124.0,
        decoration: BoxDecoration(
          color: Colors.cyanAccent[700],
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '${doc.nombre}',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, 
                    ),
                  ),
                  Text(
                    '${doc.apellido}',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${doc.correo}',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\n\n${doc.celular}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\n\n\n${doc.carnet}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future usuarioList(String searchText) async {
    List<Usuario> listUsuario = await _dbHelper.getUsuario();
    setState(() {
      if (listUsuario != null) {
        if (searchText == null || searchText == "") {
          _usuarios = Column(
              children: listUsuario.map((user) => buildItem(user)).toList());
        }
      }
    });
  }
}
