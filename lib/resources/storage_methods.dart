import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../utilities/global_variables.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;

//  ADD IMAGE TO STORAGE
  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
    bool isPost,
  ) async {
    Reference ref = _storage.ref().child(childName);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
      postImage = id;
    }
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

// UPDATE IMAGE IN STORAGE

// REMOVE IMAGE IN STORAGE
}
