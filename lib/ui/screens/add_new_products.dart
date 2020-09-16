import 'package:ecommerce_admin_side/provider/product_provider.dart';
import 'package:ecommerce_admin_side/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "\n image\n",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Consumer<ProductProvider>(
                      builder: (BuildContext context, ProductProvider value,
                          Widget child) {
                        return Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(

                              // color: Color(0xffe2e2e2),

                              // border: Border.all(

                              //   width: 1.00,

                              //   color: Color(0xffbcbcbc),

                              // ),

                              ),
                          child: value.imageFile == null
                              ? Container()
                              : Image.file(
                                  value.imageFile,
                                  fit: BoxFit.cover,
                                ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Provider.of<ProductProvider>(context,
                                listen: false)
                            .cameraImage();
                      },
                      child: Icon(Icons.file_upload),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Consumer<ProductProvider>(
                  builder: (BuildContext context, ProductProvider value,
                      Widget child) {
                    return ExpansionTile(
                      title: Text(
                        "Color",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                      subtitle: Text(
                        value.selectedColor == null
                            ? "No Color"
                            : value.selectedNameColor,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff000000).withOpacity(0.60),
                        ),
                      ),
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.colors.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 50,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            color: value.colors[index],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    value.changeSeclectedColor(index);
                                  },
                                );
                              }),
                        ),
                      ],
                    );
                  },
                ),
                Consumer<ProductProvider>(
                  builder: (BuildContext context, ProductProvider value,
                      Widget child) {
                    return ExpansionTile(
                      title: Text(
                        "Price",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                      subtitle: Text(
                        value.price == 200
                            ? "No Price"
                            : value.price.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff000000).withOpacity(0.60),
                        ),
                      ),
                      children: <Widget>[
                        Center(
                          child: Slider(
                              max: 1000,
                              min: 100,
                              value: value.price.toDouble(),
                              onChanged: (double value1) =>
                                  value.changePrice(value1)),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 90,
                      child: Text(
                        "categories",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(child: Consumer<ProductProvider>(
                        builder: (BuildContext context, ProductProvider value,
                            Widget child) {
                          return DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: value.selectedCategories,
                                items: value.categories
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value1) =>
                                    value.changeSelectedCategories(value1),
                              ),
                            ),
                          );
                        },
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 90,
                      child: Text(
                        "Size",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(child: Consumer<ProductProvider>(
                        builder: (BuildContext context, ProductProvider value,
                            Widget child) {
                          return DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: value.selectedSize,
                                items: value.sizes
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (value1) =>
                                    value.changeSelectedSize(value1),
                              ),
                            ),
                          );
                        },
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Name\n",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Consumer<ProductProvider>(
                      builder: (BuildContext context, ProductProvider value,
                          Widget child) {
                        return Expanded(
                          child: CustomTextField(
                            controller: value.nameController,
                            isDetails: false,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Details\n",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Consumer<ProductProvider>(
                      builder: (BuildContext context, ProductProvider value,
                          Widget child) {
                        return Expanded(
                          child: CustomTextField(
                            controller: value.detailsController,
                            isDetails: true,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () async {
          await Provider.of<ProductProvider>(context, listen: false)
              .setInformationProductToFireStore(scaffoldKey);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
