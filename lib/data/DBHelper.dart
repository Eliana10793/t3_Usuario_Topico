
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:login_flutter/main.dart';
import 'package:login_flutter/modelos/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
class DBHelper{

  static Database _db;

  Future <Database> get database async{
    if(_db!=null)
    return _db;
    _db=await initDB();
    return _db;
  }

//Crear Base de Datos
   Future <Database> initDB() async {
     //Obtener Directorio para Alamacenar la base de datos
     io.Directory documentsDirectory =await getApplicationDocumentsDirectory();
     String path = join(documentsDirectory.path, 'usuario.db');
     Database db = await openDatabase(
       path,
       version: 1,
       onCreate: _createTables,
     );
     print('[DBHelper] initDB: Ok');
     return db;
   }

//Crear Tabla
  void _createTables(Database db, int version) async {

    await db.execute(
      'CREATE TABLE Usuario (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, apellido TEXT, correo TEXT NOT NULL UNIQUE, celular INTEGER, carnet INTEGER NOT NULL UNIQUE )',
    );
  }

  Future <void> insertUsuario(Usuario usuario, BuildContext context) async{

    final Database db = await database;

    await db.insert(
      'Usuario',
      usuario.toMap(), 
      conflictAlgorithm: ConflictAlgorithm.replace,
      ).then((int value){
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder:(_,__,___)=>MyApp()
          ));
      });
  }

  Future <List<Usuario>> getUsuario() async{

    final Database db=await database;

    final List<Map<String, dynamic>> maps= await db.query('Usuario');
    return List.generate(maps.length, (i){
      return Usuario(
        id:maps[i]['id'],
        nombre:maps[i]['nombre'],
        apellido:maps[i]['apellido'],
        correo:maps[i]['correo'],
        celular:maps[i]['celular'],
        carnet:maps[i]['carnet'],
      );
    });
  }
}