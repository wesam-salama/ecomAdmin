import 'package:ecommerce_admin_side/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Provider.of<ProductProvider>(context).pageIndex == 0
            ? 'Admin DashBoard'
            : 'Add Product'),
        elevation: 0.0,
        backgroundColor: Colors.black87,
      ),
      body: Provider.of<ProductProvider>(context).pagesShow,
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.black87),
          currentIndex: Provider.of<ProductProvider>(context).pageIndex,
          onTap: (index) {
            Provider.of<ProductProvider>(context, listen: false)
                .getindex(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline), title: Container()),
          ]),
    );
  }
}
