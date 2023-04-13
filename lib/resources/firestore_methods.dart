import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../model/product.dart';
import 'storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   upload
  Future<String> uploadPost(
    String name,
    String brand,
    String category,
    String uid,
    int quantity,
    String price,
    Uint8List file,
  ) async {
    String res = "Some errors occurred";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage(
        "products",
        file,
        true,
      );
      String productID = const Uuid().v1();
      Product product = Product(
        productID: productID,
        uid: uid,
        name: name,
        brand: brand,
        category: category,
        quantity: quantity,
        productUrl: photoUrl,
        price: price,
      );

      _firestore.collection("products").doc(productID).set(product.toJson());
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
