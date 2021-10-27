import 'package:flutter/material.dart';
import 'package:login_flutter/data/DBHelper.dart';
import 'package:login_flutter/main.dart';
import 'package:login_flutter/modelos/usuario.dart';

class AddUsuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AddUsuario(title: 'Registrar Usuario'),
    );
  }
}

class AddUsuario extends StatelessWidget {
  final String title;
  AddUsuario({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => {
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ____) => MyApp(),
            )),
          },
        ),
      ),
      body: UsuarioForm(),
    );
  }
}

class UsuarioForm extends StatefulWidget {
  @override
  UsuarioFormState createState() {
    return UsuarioFormState();
  }
}

class UsuarioFormState extends State<UsuarioForm> {
  final _formKey = GlobalKey<FormState>();
  var _nombre= TextEditingController();
  var _apellido= TextEditingController();
  var _correo= TextEditingController();
  var _celular= TextEditingController();
  var _carnet= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                labelText: "Ingrese sus Nombres",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Por Favor Ingrese el Nombre";
                }
              },
              controller: _nombre,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                labelText: "Ingrese sus Apellidos",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Por Favor Ingrese los Apellidos";
                }
              },
              controller: _apellido,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                labelText: "Ingrese su Correo",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Por Favor Ingrese el Correo";
                }
              },
              controller: _correo,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                labelText: "Ingrese su Número de Celular",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Por Favor Ingrese el Número de Celular";
                }
              },
              controller: _celular,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                labelText: "Ingrese su Número de Carnet",
                prefixIcon: Icon(Icons.badge),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return "Por Favor Ingrese el Número de Carnet";
                }
              },
              controller: _carnet,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: MaterialButton(
              minWidth: 100.0,
              height: 60.0,
              onPressed: () {
                if(_formKey.currentState.validate()){
                  var _dbHelper=DBHelper();
                  _dbHelper.insertUsuario(Usuario(
                    id: 0,
                    nombre: _nombre.text,
                    apellido: _apellido.text,
                    correo: _correo.text,
                    celular: int.parse(_celular.text),
                    carnet: int.parse(_carnet.text),
                  ),context);  
                }
              },
              color: Colors.cyan,
              child: Text(
                "Registrar",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
