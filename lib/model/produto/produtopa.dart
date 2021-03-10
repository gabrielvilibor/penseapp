class ProdutoPA {
  int id;
  String nome;
  String descricao;
  double preco;
  double precoPromo;
  int status;
  int idCategoria;

  ProdutoPA(
      {this.id,
        this.nome,
        this.descricao,
        this.preco,
        this.precoPromo,
        this.status,
        this.idCategoria});

  ProdutoPA.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
    precoPromo = json['preco_promo'];
    status = json['status'];
    idCategoria = json['id_categoria'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['preco_promo'] = this.precoPromo;
    data['status'] = this.status;
    data['id_categoria'] = this.idCategoria;
    return data;
  }
}