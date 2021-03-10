import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_penseapp/controller/produto/produto_mobx.dart';
import 'package:flutter_penseapp/model/produto/produtopa.dart';

class ProdutoPage extends StatefulWidget {

  final ProdutoPA produto;

  ProdutoPage({this.produto});

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {

  ProdutoPA get produto => widget.produto;

  Color fav;

  var mobx = new ProdutoMobx();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobx.findById(produto, true).then((bool favorito){
      setState(() {
        fav = favorito ? Colors.red : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 350,
            pinned: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.favorite, size: 34, color: fav),
                  onPressed: (){
                      _onClickFavoritar();
                  }
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(" ${produto.nome} ",
                style: TextStyle(backgroundColor: Theme.of(context).primaryColor),),
              background: Container(
                child: Hero(
                    tag: produto.preco,
                    child: Image.network('https://controlacesta-images.s3.us-east-2.amazonaws.com/semimagemazul.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          SliverList(delegate: _sliver())
        ],
    );
  }

  void _onClickFavoritar() async {
    bool favorito = await mobx.findById(produto, false);
    setState(() {
      fav = favorito ? Colors.red : Colors.grey;
    });
  }

  _sliver() {
    FlutterMoneyFormatter preco = new FlutterMoneyFormatter(
        amount: produto.preco,
        settings: MoneyFormatterSettings(
            symbol: 'R\$',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 2,
        )
    );
    FlutterMoneyFormatter precoPromo = new FlutterMoneyFormatter(
        amount: produto.precoPromo,
        settings: MoneyFormatterSettings(
          symbol: 'R\$',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 2,
        )
    );
    return SliverChildListDelegate(
      [
        Container(
          height: 500,
          padding: EdgeInsets.all(26),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Colors.blue, Colors.blueAccent],
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.description,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Descrição",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                produto.descricao,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                produto.precoPromo < produto.preco && produto.precoPromo > 0 ?
                  " De: ${preco.output.symbolOnLeft} por ${precoPromo.output.symbolOnLeft} " :
                  " Preço: ${preco.output.symbolOnLeft} ",
                style: TextStyle(
                  fontSize: 24,
                  color: produto.precoPromo < produto.preco && produto.precoPromo > 0 ? Colors.white : Colors.black,
                  backgroundColor: produto.precoPromo < produto.preco && produto.precoPromo > 0 ? Colors.red : Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
