import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_side/models/users_model.dart';
import 'package:ecommerce_admin_side/provider/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowAllUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Users'),
        elevation: 0.0,
        backgroundColor: Colors.black87,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: Provider.of<ProductProvider>(context).getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<UserModel> users = snapshot.data;
            if (users.length > 0) {
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: users[index].photoUrl != null
                            ? CachedNetworkImageProvider(users[index].photoUrl)
                            : ExactAssetImage('assets/icons/user_image.png'),
                      ),
                      title: Text(users[index].name),
                      subtitle: Text(users[index].email),
                    );
                  });
            } else {
              return Center(
                child: Text('No Users'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
