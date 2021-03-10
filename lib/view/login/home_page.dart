import 'package:flutter/material.dart';
import 'package:flutter_penseapp/repositories/widgets/HexColor.dart';
import 'package:flutter_penseapp/repositories/widgets/bottom_nav.dart';
import 'package:flutter_penseapp/view/favoritos/favoritos_page.dart';
import 'package:flutter_penseapp/view/produtos/produtos_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> _children = [ProdutosPage(), FavoritosPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavBar(
          backgroundColor: Colors.white,
          selectedIndex: currentIndex,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                title: Text(
                  'Produtos',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                ),
                activeColor: HexColor("#2C44FF"),
                textAlign: TextAlign.center),
            BottomNavBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                title: Text(
                  'Favoritos',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 15),
                ),
                activeColor: HexColor("#2029d0"),
                textAlign: TextAlign.center),
          ],
        ));
  }
}
