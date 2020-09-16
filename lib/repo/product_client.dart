import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_side/models/products.dart';
import 'package:uuid/uuid.dart';

class ProductClient {
  ProductClient._();

  static ProductClient categoriesClient = ProductClient._();

  Firestore _firestore = Firestore.instance;

  // void createCategory(String name) {
  //   var id = Uuid();
  //   String categoryId = id.v1();

  //   _firestore
  //       .collection('categories')
  //       .document(categoryId)
  //       .setData({'category': name});
  // }

  createProduct(Products products) {
    var id = Uuid();
    String productId = id.v1();

    _firestore
        .collection('products')
        .document(productId)
        .setData(products.toJson());
  }

  Future<QuerySnapshot> getAllOrder() async {
    QuerySnapshot document =
        await _firestore.collection('order').getDocuments();

    return document;
  }

  updateOrder(Map<String, dynamic> data, String docId) async {
    await _firestore.collection('order').document(docId).updateData(data);
  }

  Future<QuerySnapshot> getAllProduct() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('products').getDocuments();
    return querySnapshot;
  }

  Future<QuerySnapshot> getAllUsers() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('Users').getDocuments();
    return querySnapshot;
  }
}
