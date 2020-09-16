
import 'package:ecommerce_admin_side/models/order_model.dart';
import 'package:ecommerce_admin_side/provider/product_provider.dart';
import 'package:ecommerce_admin_side/ui/widgets/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ShowAllOrders extends StatefulWidget {
  @override
  _ShowAllOrdersState createState() => _ShowAllOrdersState();
}

class _ShowAllOrdersState extends State<ShowAllOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'All Order',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: FutureBuilder<List<OrderModel>>(
              future: Provider.of<ProductProvider>(context).getAllOrder(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<OrderModel> orderModel = snapshot.data;
                  if (orderModel.length > 0) {
                    return ListView.builder(
                      itemCount: orderModel.length,
                      itemBuilder: (BuildContext context, int index1) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OrderDetails(
                                    orderModel: orderModel[index1],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                // leading: Container(
                                //   decoration: BoxDecoration(
                                //       color: Colors.red, shape: BoxShape.circle),
                                // ),
                                padding: const EdgeInsets.all(15.0),
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black87.withOpacity(0.2),
                                        offset: Offset(3, 2),
                                        blurRadius: 30)
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: orderModel[index1].orderStatus ==
                                                'done'
                                            ? Colors.green
                                            : orderModel[index1].orderStatus ==
                                                    'Proccessing'
                                                ? Colors.yellow
                                                : orderModel[index1]
                                                            .orderStatus ==
                                                        'shipped'
                                                    ? Colors.green[100]
                                                    : Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      // child: Card(),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('Order $index1'),
                                  ],
                                ),
                                // children: <Widget>[
                                //   Text('${orderModel[index1].address}'),
                                //   SizedBox(
                                //     height: 200,
                                //     child: ListView.builder(
                                //       itemCount: orderModel[index1].products.length,
                                //       itemBuilder: (BuildContext context, int index) {
                                //         return CardOrder(
                                //           products:
                                //               orderModel[index1].products[index],
                                //         );
                                //       },
                                //     ),
                                //   ),
                                // ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            IconSlideAction(
                              caption: 'Edit',
                              color: Colors.blue,
                              icon: Icons.edit,
                              onTap: () {},
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.remove_shopping_cart,
                            size: 200,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'The order is empty',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )),
    );
  }
}
