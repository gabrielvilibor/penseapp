import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class Connection {

  static const DATABASE_NAME = 'penseapp.db';
  static const VERSION = 1;
  static Connection _instance;
  Database _db;
  final _lock = Lock();

  factory Connection(){
    if(_instance != null){
      _instance = Connection._();
    }else if(_instance == null){
      _instance = Connection._();
    }
    return _instance;
  }

  Connection._();

  Future<Database> get instance async => await _openConnection();

  Future<Database> _openConnection() async{

    if(_db == null){
      await _lock.synchronized(() async{ // protege para não chamar duas instancias de banco ao mesmo tempo
        if(_db == null){
          var databasePath = await getDatabasesPath();
          var path = join(databasePath, DATABASE_NAME);
          print('path $path');
          _db = await openDatabase(
              path,
              version: VERSION,
              onConfigure: _onConfigure,
              onCreate: _onCreate,
              onUpgrade: _onUpgrade
          );
          print("conectado o banco de dados");
        }
      });
      return _db;
    }
  }

  void closeConnection(){
    _db?.close(); // se ele nao for nula, fecha
    _db = null; // garante que volta a ficar nula
  }

  FutureOr<void> _onConfigure(Database db) async{
    await db.execute('PRAGMA foreign_keys = ON');
  }

  FutureOr<void> _onCreate(Database db, int version) async{ // metodo para criar tabelas
    String sql = await rootBundle.loadString("assets/sql/create.sql");

    List<String> sqls = sql.split(";");
    for(String sql in sqls){
      if(sql.trim().isNotEmpty){
        print("sql:$sql");
        await db.execute(sql);
      }
    }
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async{

    if(newVersion == 2){
      // executar updates
    }
  }
}