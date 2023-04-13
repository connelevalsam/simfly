import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String? image;

  User({
    required this.uid,
    required this.email,
    required this.name,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return User(
      uid: snap["uid"],
      name: snap["name"],
      email: snap["email"],
    );
  }
}
