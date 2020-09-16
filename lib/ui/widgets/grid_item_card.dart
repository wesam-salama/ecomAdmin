import 'package:ecommerce_admin_side/models/grid_item.dart';
import 'package:flutter/material.dart';

class GridItemCard extends StatelessWidget {
  final GridItemModel gridItemModel;
  GridItemCard({this.gridItemModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(gridItemModel.icon),
              SizedBox(
                width: 10,
              ),
              Text(gridItemModel.name),
            ],
          ),
          Text(
            gridItemModel.details,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 60.0),
          ),
        ],
      )),
    );
  }
}
