import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String name;
  String photoUrl;
  String docId;

  UserModel({
    this.email,
    this.name,
    this.photoUrl,
  });

  UserModel.fromDocument(DocumentSnapshot snapshot) {
    this.docId = snapshot.documentID;
    this.email = snapshot.data['email'];
    this.name = snapshot.data['name'];
    this.photoUrl = snapshot.data['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'name': this.name,
      'photoUrl': this.photoUrl,
    };
  }
}
