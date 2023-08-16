import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart';

final commonFirebaseStorageRepositoryProvider = Provider((ref) => CommonFirebaseStorageRepositoryProvider(
  firebaseStorage: FirebaseStorage.instance
));

class CommonFirebaseStorageRepositoryProvider {
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorageRepositoryProvider({required this.firebaseStorage});
  
  Future <String> storageFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}