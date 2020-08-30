import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/HomeTab.dart';
import 'package:loja_virtual/tabs/ProductsTab.dart';
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
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Container(color:Colors.green),
        Container(color:Colors.blue),
      ],
    );
  }
}
