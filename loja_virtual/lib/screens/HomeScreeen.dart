import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/HomeTab.dart';
import 'package:loja_virtual/tabs/OrdersTabs.dart';
import 'package:loja_virtual/tabs/PlacesTabs.dart';
import 'package:loja_virtual/tabs/ProductsTab.dart';
import 'package:loja_virtual/widgets/CartButton.dart';
import 'package:loja_virtual/widgets/CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body:HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Lojas"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlacesTabs(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Meus Pedidos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: OrdersTabs(),
        )
      ],
    );
  }
}
