// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommer_admin/models/products.dart';
// import 'package:ecommer_admin/provider/product_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ShowAllProducts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Products>>(
//         future: Provider.of<ProductProvider>(context).getAllProduct(),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
//           if (snapshot.hasData) {
//             List<Products> products = snapshot.data;
//             if (products.length > 0) {
//               return ListView.builder(
//                   itemCount: products.length,
//                   itemBuilder: (BuildContext context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         // Navigator.of(context).push(
//                         // MaterialPageRoute(
//                         //   builder: (BuildContext context) => CourseInfoScreen(
//                         //     products: products,
//                         //   ),
//                         // ),
//                         // );
//                       },
//                       child: Container(
//                         height: 200,
//                         width: 180,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 6,
//                                 color: Colors.grey.withOpacity(0.2),
//                                 spreadRadius: 5,
//                               ),
//                             ]),
//                         child: Stack(
//                           children: <Widget>[
//                             Container(
//                               height: 175,
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: [Colors.white, Color(0xFFACBEA3)],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   topRight: Radius.circular(10),
//                                 ),
//                               ),
//                             ),

//                             // Hero(
//                             //   tag: products.photoUrl,
//                             Container(
//                               height: 175,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: CachedNetworkImageProvider(
//                                       products[index].photoProduct),
//                                   fit: BoxFit.cover,
//                                 ),
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   topRight: Radius.circular(10),
//                                 ),
//                               ),
//                               // child: CachedNetworkImage(
//                               //   fit: BoxFit.cover,
//                               //   imageUrl: products.photoUrl,
//                               //   placeholder: (context, url) => SpinKitRotatingCircle(
//                               //     color: Colors.white,
//                               //     size: 50.0,
//                               //   ),
//                               // ),
//                             ),
//                             // ),

//                             Positioned(
//                               top: 190,
//                               left: 10,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(
//                                     products[index].nameProduct,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.black,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 3,
//                                   ),
//                                   Container(
//                                     width: 175,
//                                     child: Row(
//                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: <Widget>[
//                                         Row(
//                                           children: <Widget>[
//                                             Text(
//                                               '4.6',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 3,
//                                             ),
//                                             Row(
//                                               children: <Widget>[
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.green,
//                                                   size: 14,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.green,
//                                                   size: 14,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.green,
//                                                   size: 14,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.green,
//                                                   size: 14,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.green,
//                                                   size: 14,
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           width: 15,
//                                         ),
//                                         Text(
//                                           "\$${products[index].price}",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w400,
//                                             color: Colors.black,
//                                             fontSize: 16,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//             } else {
//               return Center(
//                 child: Text('No Products'),
//               );
//             }
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_side/models/products.dart';
import 'package:ecommerce_admin_side/provider/product_provider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class ShowAllProducts extends StatefulWidget {
  @override
  _ShowAllProductsState createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  // Text _buildRatingStars(int rating) {
  //   String stars = '';
  //   for (int i = 0; i < rating; i++) {
  //     stars += '⭐ ';
  //   }
  //   stars.trim();
  //   return Text(stars);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Products'),
        elevation: 0.0,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<Products>>(
              future: Provider.of<ProductProvider>(context).getAllProduct(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  List<Products> products = asyncSnapshot.data;
                  if (products.length > 0) {
                    return AnimationLimiter(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          Products pr = products[index];
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: products.length,
                            child: ScaleAnimation(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        40.0, 5.0, 20.0, 5.0),
                                    height: 170.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          100.0, 20.0, 20.0, 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 120.0,
                                                child: Text(
                                                  pr.nameProduct,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              Text(
                                                '\$${pr.price}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            pr.color,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          // _buildRatingStars(pr.categories),
                                          SizedBox(height: 10.0),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(5.0),
                                                width: 70.0,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                alignment: Alignment.center,
                                                // child: Text(
                                                //   activity.startTimes[0],
                                                // ),
                                              ),
                                              SizedBox(width: 10.0),
                                              Container(
                                                padding: EdgeInsets.all(5.0),
                                                width: 70.0,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                alignment: Alignment.center,
                                                // child: Text(
                                                //   activity.startTimes[1],
                                                // ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20.0,
                                    top: 15.0,
                                    bottom: 15.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image(
                                        width: 110.0,
                                        image: CachedNetworkImageProvider(
                                            pr.photoProduct),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Text('No Products'),
                    );
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
