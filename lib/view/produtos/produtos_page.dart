import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_penseapp/controller/produto/produto_mobx.dart';
import 'package:flutter_penseapp/model/produto/produtopa.dart';
import 'package:flutter_penseapp/repositories/utils/nav.dart';
import 'package:flutter_penseapp/repositories/widgets/HexColor.dart';
import 'package:flutter_penseapp/view/produtos/produto_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ProdutosPage extends StatefulWidget {

  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {

  var mobx = new ProdutoMobx();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onRefresh();
  }

  _onRefresh(){
    mobx.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Teste - Pense App', style: TextStyle(color: Colors.white),)),
      body: Container(
        color: Colors.white,
        child: Observer(
          builder: (_){

            List<ProdutoPA> list = mobx.produtos;

            if(mobx.error != null){
              return Text('Não foi possivel carregar devido ao erro: \n\n ${mobx.error}');
            }

            if(mobx.produtos == null){
              return Center(child: CircularProgressIndicator());
            }

            return _list(list);
          },
        ),
      ),
    );
  }

  _list(List<ProdutoPA> list) {
    return ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (context, index){
        ProdutoPA pa = list[index];
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                          color: Colors.white,
                          child: Image.network('https://controlacesta-images.s3.us-east-2.amazonaws.com/semimagemazul.jpg',
                          height: 64,
                          width: 64,
                          ),
                        )
                    ),
                    Positioned(
                        bottom: 8,
                        left: 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: Text(
                            pa.nome, style: GoogleFonts.robotoSlab(fontSize: 32, fontWeight: FontWeight.bold, color: HexColor("7E1FFF")),
                          ),
                        ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                child: ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                    onPressed: (){
                        push(context, ProdutoPage(produto: pa));
                    },
                    icon: Icon(Icons.add, size: 32, color: Colors.white,),
                    )
                  ],
                ),
              )
            ],
          ),
        );
    });
  }
}
