import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return model.User.fromSnap(snapshot);
  }

  // sign up
  Future<String> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    String res = "An error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        model.User user = model.User(
          uid: credential.user!.uid,
          name: name,
          email: email,
        );

        await _firestore.collection("users").doc(credential.user!.uid).set(
              user.toJson(),
            );
        res = "Successful";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // sign in user
  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred!";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Successful";
      } else {
        res = "Please fill all fields!";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
