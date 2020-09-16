import 'package:flutter/material.dart';

class GridItemModel {
  String name;
  IconData icon;
  String details;
  Function destination;

  GridItemModel({this.name, this.details, this.icon, this.destination});
}
