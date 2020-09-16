import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  int id;
  String nameProduct;
  String detailsProduct;
  String size;
  String color;
  int price;
  String docId;
  String photoProduct;
  String cateogre;
  int count;

  static final String cardTableName = 'cards';
  static final String cardIdColum = 'id';
  static final String cardNameColum = 'name';
  static final String cardSizeColum = 'size';
  static final String cardColorColum = 'color';
  static final String cardPriceColum = 'price';
  static final String cardCountColum = 'count';
  static final String cardPhotoProductColum = 'photoProduct';
  static final String cardCategoriesColum = 'categories';
  static final String cardDetailsProductColum = 'detailsProduct';

  Products(
      {this.nameProduct,
      this.size,
      this.color,
      this.price,
      this.count,
      this.detailsProduct,
      this.photoProduct,
      this.cateogre});

  Products.fromJson(Map<String, dynamic> map) {
    this.nameProduct = map[cardNameColum];
    this.size = map[cardSizeColum];
    this.color = map[cardColorColum];
    this.price = map[cardPriceColum];
    this.count = map[cardCountColum];
    this.photoProduct = map[cardPhotoProductColum];
    this.detailsProduct = map[cardDetailsProductColum];
    // this.cateogre = map[cardCategoriesColum];
  }
  Products.fromDocument(DocumentSnapshot snapshot) {
    this.docId = snapshot.documentID;
    this.nameProduct = snapshot.data[cardNameColum];
    this.size = snapshot.data[cardSizeColum];
    this.color = snapshot.data[cardColorColum];
    this.price = snapshot.data[cardPriceColum];
    this.count = snapshot.data[cardCountColum];
    this.photoProduct = snapshot.data[cardPhotoProductColum];
    this.cateogre = snapshot.data[cardCategoriesColum];
    this.detailsProduct = snapshot.data[cardDetailsProductColum];
  }
  Map<String, dynamic> toJson() {
    return {
      cardIdColum: this.id,
      cardNameColum: this.nameProduct,
      cardSizeColum: this.size,
      cardColorColum: this.color,
      cardPriceColum: this.price,
      // cardCountColum: this.count,
      cardPhotoProductColum: this.photoProduct,
      cardCategoriesColum: this.cateogre,
      cardDetailsProductColum: this.detailsProduct,
    };
  }

  Map<String, dynamic> toJson2() {
    return {
      // cardIdColum: this.id,
      cardNameColum: this.nameProduct,
      cardSizeColum: this.size,
      cardColorColum: this.color,
      cardPriceColum: this.price,
      cardCountColum: this.count,
      cardPhotoProductColum: this.photoProduct,
      // cardCategoriesColum: this.cateogre,
      cardDetailsProductColum: this.detailsProduct,
    };
  }
}
