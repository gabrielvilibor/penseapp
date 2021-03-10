// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoMobx on ProdutoMobxBase, Store {
  final _$produtosAtom = Atom(name: 'ProdutoMobxBase.produtos');

  @override
  List<ProdutoPA> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<ProdutoPA> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('ProdutoMobxBase.fetch');

  @override
  Future<List<ProdutoPA>> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
produtos: ${produtos}
    ''';
  }
}
