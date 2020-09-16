import 'package:cloud_firestore/cloud_firestore.dart';

import 'products.dart';

class OrderModel {
  List<Map<String, dynamic>> products;

  String docId;
  String address;
  String userId;
  int totalPrice;
  String orderStatus;
  String date;
  OrderModel(
      {this.address,
      this.userId,
      this.products,
      this.totalPrice,
      this.date,
      this.orderStatus});

  OrderModel.fromDocument(DocumentSnapshot snapshot) {
    this.docId = snapshot.documentID;
    this.address = snapshot.data['address'];
    this.orderStatus = snapshot.data['orderStatus'];
    this.date = snapshot.data['date'];

    this.userId = snapshot.data['userId'];
    this.totalPrice = snapshot.data['totalPrice'];

    this.products = new List<Map<String, dynamic>>();
    snapshot.data['products'].forEach((v) {
      products.add(Products.fromJson(v).toJson2());
    });
  }

  Map<String, dynamic> toJson() {
    return {
      'orderStatus': this.orderStatus,
      'products': this.products,
      'date': this.date,
      'userId': this.userId,
      'totalPrice': this.totalPrice,
      'address': this.address,
    };
  }
}
