import 'package:flutter_penseapp/controller/login/login_api.dart';
import 'package:flutter_penseapp/controller/repo/api_response.dart';
import 'package:flutter_penseapp/model/usuario/usuario.dart';
import 'package:mobx/mobx.dart';
part 'login_mobx.g.dart';

class LoginMobx = LoginMobxBase with _$LoginMobx;

abstract class LoginMobxBase with Store{
  @action
  Future<ApiResponse<Usuario>> login(LoginInput input) async{
    try{
      return await LoginApi.login(input);
    }finally{

    }
  }
}