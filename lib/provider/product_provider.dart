import 'dart:io';

import 'package:ecommerce_admin_side/models/order_model.dart';
import 'package:ecommerce_admin_side/models/products.dart';
import 'package:ecommerce_admin_side/models/users_model.dart';
import 'package:ecommerce_admin_side/repo/product_client.dart';
import 'package:ecommerce_admin_side/repo/product_repository.dart';
import 'package:ecommerce_admin_side/ui/screens/add_new_products.dart';
import 'package:ecommerce_admin_side/ui/screens/information_products.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductProvider extends ChangeNotifier {
  String url;
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.black,
    Colors.greenAccent
  ];

  List<String> categories = ['Men', 'Women', 'Baby'];
  List<String> sizes = ['XXL', 'XL', 'L', 'M', 'S'];

  String valueStatus;

  List<Products> products = [];
  List<OrderModel> orders = [];
  List<UserModel> users = [];

  Future<List<Products>> getAllProduct() async {
    List<Products> pro =
        await FirebaseRepository.firebaseRepository.getAllProducts();

    return pro;
  }

  getLengthProduct() async {
    List<Products> pro =
        await FirebaseRepository.firebaseRepository.getAllProducts();
    products = pro;
    notifyListeners();
  }

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> pro =
        await FirebaseRepository.firebaseRepository.getAllUsers();

    return pro;
  }

  getLengthUsers() async {
    List<UserModel> pro =
        await FirebaseRepository.firebaseRepository.getAllUsers();
    users = pro;
    notifyListeners();
  }

  changeStatus(String value) {
    this.valueStatus = value;
    notifyListeners();
  }

  File imageFile;
  int price = 200;

  Color selectedColor;
  String selectedNameColor;
  String selectedCategories = 'Men';
  String selectedSize = 'XL';

  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  changeSelectedSize(String val) {
    this.selectedSize = val;
    notifyListeners();
  }

  changeSelectedCategories(String val) {
    this.selectedCategories = val;
    notifyListeners();
  }

  changePrice(double value) {
    this.price = value.toInt();
    notifyListeners();
  }

  changeSeclectedColor(int index) {
    switch (index) {
      case 0:
        selectedColor = colors[0];
        selectedNameColor = 'Red';
        notifyListeners();

        break;
      case 1:
        selectedColor = colors[1];
        selectedNameColor = 'green';
        notifyListeners();

        break;
      case 2:
        selectedColor = colors[2];
        selectedNameColor = 'yellow';
        notifyListeners();

        break;
      case 3:
        selectedColor = colors[3];
        selectedNameColor = 'black';
        notifyListeners();

        break;
      case 4:
        selectedColor = colors[4];
        selectedNameColor = 'greenAccent';
        notifyListeners();

        break;
    }
  }

  cameraImage() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 10);

    imageFile = File(image.path);

    DateTime date = DateTime.now();

    StorageTaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child('productsImage/$date.jpg')
        .putFile(imageFile)
        .onComplete;

    url = await snapshot.ref.getDownloadURL();
    notifyListeners();
  }

  createProduct(Products products) async {
    await ProductClient.categoriesClient.createProduct(products);
  }

  setInformationProductToFireStore(GlobalKey<ScaffoldState> scaffoldKey) async {
    if (url != null && nameController != null && detailsController != null) {
      Products p = Products(
          size: selectedSize,
          cateogre: selectedCategories,
          price: price,
          color: selectedNameColor,
          nameProduct: nameController.text,
          detailsProduct: detailsController.text,
          photoProduct: url);

      await createProduct(p);

      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text('Add Success')));

      // showDialog(
      //     context: scaffoldKey.currentContext,
      //     builder: (context) {
      //       return CupertinoAlertDialog(
      //         title: Text('Add product Success'),
      //       );
      //     });

      // pagesShow = pages[0];
      // pageIndex = 0;
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please fill all details')));
    }

    notifyListeners();
  }

  //---------------------------------------
  int totalPriceAllCard = 0;
  getAllBuyingTotal() async {
    List<OrderModel> orders =
        await FirebaseRepository.firebaseRepository.getAllOrder();
    int total = 0;

    for (var i = 0; i < orders.length; i++) {
      total += orders[i].totalPrice;
    }
    this.totalPriceAllCard = total;
    notifyListeners();
  }

  Future<List<OrderModel>> getAllOrder() async {
    List<OrderModel> orderModel =
        await FirebaseRepository.firebaseRepository.getAllOrder();

    return orderModel;
  }

  getLengthOrder() async {
    List<OrderModel> orderModel =
        await FirebaseRepository.firebaseRepository.getAllOrder();
    orders = orderModel;
    notifyListeners();
  }

  updateOrder(OrderModel orderModel, String docId) async {
    await ProductClient.categoriesClient
        .updateOrder(orderModel.toJson(), docId);
  }

  //=====================================
  int pageIndex = 0;
  Widget pagesShow = InformationProducts();

  final List pages = [
    InformationProducts(),
    AddNewProduct(),
  ];

  getindex(int index) {
    switch (index) {
      case 0:
        pagesShow = pages[0];
        pageIndex = 0;
        notifyListeners();
        break;
      case 1:
        pagesShow = pages[1];
        pageIndex = 1;
        notifyListeners();
        break;

      default:
    }
  }
}
