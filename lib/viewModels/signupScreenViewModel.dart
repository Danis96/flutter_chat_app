import 'package:c/utils/globals.dart';
import 'package:c/views/chat_dashboard/pages/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:image_picker/image_picker.dart';

class SignupScreenViewModel {
  registerUser(
      BuildContext context, String email, String password, String name) async {
    try {
      String filename = basename(image.path);
      StorageReference firebaseStorage =
          FirebaseStorage.instance.ref().child(filename);
      StorageUploadTask uploadTask = firebaseStorage.putFile(image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      var downloadURL;
      downloadURL = await taskSnapshot.ref.getDownloadURL();
      imageURL = downloadURL.toString();

      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await Firestore.instance.collection('Users').document(email).setData({
        'email': email,
        'image': imageURL,
        'name': name,
        'password': password,
        'user_id': user.uid,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatDashboard(user)),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future getImageFromGallery() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
}
