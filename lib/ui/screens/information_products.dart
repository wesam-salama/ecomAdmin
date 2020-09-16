import 'package:ecommerce_admin_side/models/cart_data_model.dart';
import 'package:ecommerce_admin_side/models/grid_item.dart';
import 'package:ecommerce_admin_side/provider/product_provider.dart';
import 'package:ecommerce_admin_side/ui/screens/show_all_products.dart';
import 'package:ecommerce_admin_side/ui/screens/show_all_users.dart';
import 'package:ecommerce_admin_side/ui/widgets/grid_item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'show_all_orders.dart';

class InformationProducts extends StatefulWidget {
  @override
  _InformationProductsState createState() => _InformationProductsState();
}

class _InformationProductsState extends State<InformationProducts> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ProductProvider>(context).getLengthProduct();
    Provider.of<ProductProvider>(context).getLengthOrder();
    Provider.of<ProductProvider>(context).getLengthUsers();
    Provider.of<ProductProvider>(context).getAllBuyingTotal();
  }

  @override
  Widget build(BuildContext context) {
    final List<GridItemModel> gridItemCard = [
      GridItemModel(
        name: 'Users',
        icon: Icons.people_outline,
        details: '${Provider.of<ProductProvider>(context).users.length}',
        destination: () => ShowAllUsers(),
      ),
      GridItemModel(
        name: 'Producs',
        icon: Icons.track_changes,
        details: '${Provider.of<ProductProvider>(context).products.length}',
        destination: () => ShowAllProducts(),
      ),
      GridItemModel(
        name: 'Orders',
        icon: Icons.shopping_cart,
        details: '${Provider.of<ProductProvider>(context).products.length}',
        destination: () => ShowAllOrders(),
      ),
      // GridItemModel(name: 'Users', icon: Icons.people_outline, details: '12'),
    ];

    List<ChartDataModel> chartData = [
      ChartDataModel(total: 33.4, colors: Colors.red, title: 'total'),
      ChartDataModel(total: 33.4, colors: Colors.blue, title: 'buying'),
      ChartDataModel(total: 33.4, colors: Colors.amber, title: 'bof'),
    ];
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Expanded(

          // ),
          // Text('Buying'),
          // Text('${Provider.of<ProductProvider>(context).totalPriceAllCard}'),
          Expanded(
            child: GridView.builder(
              itemCount: gridItemCard.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                gridItemCard[index].destination()));
                  },
                  child: GridItemCard(
                    gridItemModel: gridItemCard[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
