import 'package:flutter/material.dart';
import 'package:flutter_penseapp/controller/login/login_api.dart';
import 'package:flutter_penseapp/controller/login/login_mobx.dart';
import 'package:flutter_penseapp/controller/repo/api_response.dart';
import 'package:flutter_penseapp/repositories/utils/alert.dart';
import 'package:flutter_penseapp/repositories/utils/nav.dart';
import 'package:flutter_penseapp/repositories/widgets/app_input_text.dart';
import 'package:flutter_penseapp/repositories/widgets/my_app_button.dart';
import 'package:flutter_penseapp/view/login/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  final _input = LoginInput();

  final _model = LoginMobx();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //BgLogin(),
          _login()
        ],
      ),
    );
  }

  _login() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 150,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueAccent[200],
                    shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Image.asset('assets/login/logo.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: AppInputText("Usuário", "Digite seu usuário", controller: _tLogin, validator: _validarLogin,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => this._input.login = value),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: AppInputText("Senha", "Digite sua senha", controller: _tSenha, validator: _validarSenha,
                  textInputAction: TextInputAction.done, password: true,
                  onSaved: (value) => this._input.pass = value),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: MyAppButton("Acessar", color1: "#2029D0", color2: "#2C44FF", onPressed: _onClickLogin,),
            ),
          ],
        ),
      ),
    );
  }

  String _validarLogin(String value) {
    if(value.isEmpty){
      return "Nome de Usuário é obrigatório";
    }
    return null;
  }

  String _validarSenha(String value) {
    if(value.isEmpty){
      return "Senha é obrigatória";
    }else if(value.length < 3){
      return "Senha muito curta";
    }
    return null;
  }

  _onClickLogin() async{
    bool formOk = _formKey.currentState.validate();

    if(!formOk){
      return;
    }

    _input.login = _tLogin.text;
    _input.pass = _tSenha.text;

    ApiResponse response = await _model.login(_input);

    print(response.ok);

    if(response.ok){
      push(context, HomePage(), replace: true);
    }else{
      alert(context, 'Usuário e/ou Senha inválido');
    }

  }
}
