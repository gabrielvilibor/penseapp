import 'package:flutter_penseapp/controller/repo/api_response.dart';
import 'package:flutter_penseapp/model/usuario/usuario.dart';
import 'package:flutter_penseapp/repositories/token/token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApi {

  static Future<ApiResponse<Usuario>> login(LoginInput login) async{

    String access_token = await Token.token();

    final url = "http://controlacesta.us-east-2.elasticbeanstalk.com/usuario/login";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + access_token
    };

    Map body = {"usuario": login.login, "senha": login.pass};

    String jsonBody = json.encode(body);

    final response = await http.post(url, headers: headers, body: jsonBody);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final map = json.decode(response.body);

    if(response.statusCode == 200){
      final user = Usuario.fromJson(map);
      return ApiResponse.ok(user);
    }else{
      return ApiResponse.error('Usuário e/ou Senha inválido');
    }

  }

}

class LoginInput{
  String login;
  String pass;

  toMap(){
    return {
      "login":login,
      "pass":pass
    };
  }
}