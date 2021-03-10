import 'package:dio/dio.dart';
import 'package:flutter_penseapp/model/produto/produtopa.dart';
import 'package:flutter_penseapp/repositories/token/token.dart';
import 'dart:convert';

class ProdutoApi {

  static Future<List<ProdutoPA>> getProdutos() async{ // metodo para recuperar produtos da API
    try{
      
      final dio = new Dio(BaseOptions(baseUrl: 'http://controlacesta.us-east-2.elasticbeanstalk.com'));

      String access_token = await Token.token(); // metodo para pegar o token
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + access_token
      };

      Response<String> response = await dio.get('/produtopa', options: Options(
        headers: headers
      ));

      List responseBody = json.decode(response.data);

      if(response.statusCode == 200 || response.statusCode == 201){
        var produtos = responseBody.map<ProdutoPA>((p) => ProdutoPA.fromMap(p)).toList();
        return produtos;
      }
      return null;
    }catch(e){
      return e;
    }
  }
}