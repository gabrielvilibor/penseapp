class Favorito {
  int id;
  int idProduto;
  String nome;
  String descricao;
  double preco;
  double precoOferta;

  Favorito({this.id, this.idProduto, this.nome, this.descricao, this.preco, this.precoOferta});

  Favorito.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    idProduto = json['id_produto'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
    precoOferta = json['preco_promo'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_produto'] = this.idProduto;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['preco_promo'] = this.precoOferta;
    return data;
  }
}