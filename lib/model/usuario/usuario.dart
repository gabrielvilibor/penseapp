import 'dart:convert';

class Usuario {

  int id;
  String usuario;

  Usuario(
      {this.id,
        this.usuario
      });

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario'] = this.usuario;
    return data;
  }

  /*void save() {
    Map map = toJson();
    String dados = json.encode(map);
    Prefs.setString("user.prefs", dados);
  }

  static Future<Usuario> get() async{
    String dados = await Prefs.getString("user.prefs");
    if(dados.isEmpty){
      return null;
    }
    Map map = json.decode(dados);
    Usuario user = Usuario.fromJson(map);
    return user;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }*/

  @override
  String toString() {
    return 'Usuario{id: $id, login: $usuario';
  }


}