import 'dart:convert';

import 'package:flutter_penseapp/controller/database/connection.dart';
import 'package:flutter_penseapp/model/favorito/favorito.dart';
import 'package:flutter_penseapp/model/produto/produtopa.dart';

class DataBaseHelper {

  Future<List<Favorito>> findAll(String table) async{ // retorna todos favoritos

    var conn = await Connection().instance;
    var result = await conn.rawQuery("SELECT * FROM $table");

    List<Favorito> list = result.map((e) => Favorito.fromMap(e)).toList();
    return list;
  }

  Future<bool> findById(int id_produto) async{ // encontra pelo id
    var conn = await Connection().instance;
    var result = await conn.rawQuery("SELECT favoritos.id FROM favoritos where favoritos.id_produto = ?", [id_produto]);
    if(result.isNotEmpty){
      return true;
    }
    return false;
  }

  Future<int> saveOrDel(ProdutoPA p) async{ //salva ou deleta favorito
    var conn = await Connection().instance;
    int id = 0;
    var result = await conn.rawQuery("SELECT favoritos.id FROM favoritos WHERE favoritos.id_produto = ?", [p.id]);
    print('save or delete $result');
    if(result.isNotEmpty){
      id = await conn.rawDelete('DELETE FROM favoritos WHERE id_produto = ?', [p.id]);
    }else{
      print(p.precoPromo);
      id = await conn.rawInsert('insert into favoritos(id, id_produto, nome, descricao, preco, precoOferta) values (?, ?, ?, ?, ?, ?)',
          [null, p.id, p.nome, p.descricao, p.preco, p.precoPromo]);
    }
    return id;
  }

}