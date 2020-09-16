import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_side/models/order_model.dart';
import 'package:ecommerce_admin_side/models/products.dart';
import 'package:ecommerce_admin_side/models/users_model.dart';

import 'product_client.dart';

class FirebaseRepository {
  FirebaseRepository._();

  static FirebaseRepository firebaseRepository = FirebaseRepository._();

  getAllOrder() async {
    QuerySnapshot documentSnapshot =
        await ProductClient.categoriesClient.getAllOrder();

    List<OrderModel> orders = documentSnapshot.documents
        .map((e) => OrderModel.fromDocument(e))
        .toList();
    return orders;
  }

  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot documentSnapshot =
        await ProductClient.categoriesClient.getAllUsers();

    List<UserModel> products = documentSnapshot.documents
        .map((e) => UserModel.fromDocument(e))
        .toList();
    // print(products);
    return products;
  }

  Future<List<Products>> getAllProducts() async {
    QuerySnapshot documentSnapshot =
        await ProductClient.categoriesClient.getAllProduct();

    List<Products> products = documentSnapshot.documents
        .map((e) => Products.fromDocument(e))
        .toList();
    // print(products);
    return products;
  }

  updateOrder(OrderModel orderModel, String docId) async {
    QuerySnapshot querySnapshot = await ProductClient.categoriesClient
        .updateOrder(orderModel.toJson(), docId);

    List<OrderModel> orderModel2 =
        querySnapshot.documents.map((e) => OrderModel.fromDocument(e)).toList();
    return orderModel2;
  }
}
