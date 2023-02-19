import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImagePath = "".obs;
  var profileImageLink = "";
  var isLoading = false.obs;

  // Textfeild Controller
  var nameController = TextEditingController();
  var passwordController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

// Upload Image
  uploadImage() async {
    var filename = basename(profileImagePath.value);
    var destination = "/images/${currentUser!.uid}/$filename";
    var ref =  FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
  profileImageLink = await ref.getDownloadURL();
  }

updateProfile({name,password,imgUrl})async {
  var store = firestore.collection(usersCollection).doc(currentUser!.uid);
  await store.update({
    'name':name,
    'password':password,
    'imageUrl':imgUrl,
  });
  isLoading(false);
}

}
