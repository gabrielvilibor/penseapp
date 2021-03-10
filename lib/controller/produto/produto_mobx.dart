import 'package:flutter_penseapp/controller/database/database_helper.dart';
import 'package:flutter_penseapp/controller/produto/produto_api.dart';
import 'package:flutter_penseapp/model/favorito/favorito.dart';
import 'package:flutter_penseapp/model/produto/produtopa.dart';
import 'package:mobx/mobx.dart';
part 'produto_mobx.g.dart';

class ProdutoMobx = ProdutoMobxBase with _$ProdutoMobx;

abstract class ProdutoMobxBase with Store{

  @observable
  List<ProdutoPA> produtos;

  @observable
  List favoritos;

  @observable
  int salvo = 0;

  @observable
  Error error;

  @action
  Future<List<ProdutoPA>> fetch() async{
    try{
      produtos = await ProdutoApi.getProdutos();
    }catch(e){
      error = e;
    }finally{

    }
  }

  @action
  Future<int> saveOrDel(ProdutoPA produtoPA) async {
    try{
      salvo = await DataBaseHelper().saveOrDel(produtoPA);
    }
    catch(e){
      error = e;
    }
  }

  @action
  Future<List<Favorito>> fetchFav() async{
    try{
      favoritos = await DataBaseHelper().findAll('favoritos');
      produtos = await ProdutoApi.getProdutos();
    }
    catch(e){
      error = e;
    }
  }

  @action
  Future<bool> findById(ProdutoPA produtoPA, bool start) async{
    try{
      bool fav = await DataBaseHelper().findById(produtoPA.id); // verifica se existe
      if(!start){ // se não for o primeiro carregamento, quer dizer que clicou, então deleta ou salva - reduz metodos
        if(fav){
          saveOrDel(produtoPA);
          return false;
        }else{
          saveOrDel(produtoPA);
          return true;
        }
      }
      return fav;
    }
    catch(e){
      error = e;
    }
  }
}