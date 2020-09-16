import 'package:ecommerce_admin_side/models/order_model.dart';
import 'package:ecommerce_admin_side/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'car_order.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel orderModel;

  OrderDetails({this.orderModel});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.orderModel.products.length,
              itemBuilder: (BuildContext context, int index) {
                return CardOrder(
                  products: widget.orderModel.products[index],
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                DropdownButton(
                    value: widget.orderModel.orderStatus,
                    items: [
                      DropdownMenuItem(child: Text('done'), value: 'done'),
                      DropdownMenuItem(
                          child: Text('Proccessing'), value: 'Proccessing'),
                      DropdownMenuItem(
                          child: Text('shipped'), value: 'shipped'),
                    ],
                    onChanged: (value) async {
                      await provider.changeStatus(value);
                      setState(() {});
                      widget.orderModel.orderStatus =
                          Provider.of<ProductProvider>(context, listen: false)
                              .valueStatus;

                      OrderModel orderModel2 = OrderModel(
                          orderStatus: provider.valueStatus,
                          address: widget.orderModel.address,
                          date: widget.orderModel.date,
                          totalPrice: widget.orderModel.totalPrice,
                          userId: widget.orderModel.userId,
                          products: widget.orderModel.products);
                      Provider.of<ProductProvider>(context, listen: false)
                          .updateOrder(orderModel2, widget.orderModel.docId);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
