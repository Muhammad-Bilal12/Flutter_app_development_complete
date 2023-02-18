import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../widgets/rounded_btn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
// Firebase Storage
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('posts');

  bool loading = false;
// image picker
  File? _image;
  final picker = ImagePicker();
  Future<void> getGalleryImage() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      print(pickedImage.path);
    } else {
      Utils.toastMessage("No image Picked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  getGalleryImage();
                },
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(border: Border.all()),
                  child: _image != null
                      ? Image.file(_image!.absolute)
                      : const Center(
                          child: Icon(Icons.image),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              RoundBtn(
                  loading: loading,
                  onPress: () async {
                    firebase_storage.Reference ref =
                        firebase_storage.FirebaseStorage.instance.ref(
                            '/my_image_folder/${DateTime.now().millisecondsSinceEpoch}');
                    firebase_storage.TaskSnapshot snapshot =
                        await ref.putFile(_image!.absolute);
                    setState(() {
                      loading = true;
                    });

                    Future.value().then((value) async {
                      var newUrl = await snapshot.ref.getDownloadURL();

                      setState(() {
                        loading = false;
                      });
                      Utils.toastMessage("Uploaded");
                      String id =
                          DateTime.now().millisecondsSinceEpoch.toString();
                    }).onError((error, stackTrace) {
                      setState(() {
                        loading = false;
                      });
                      Utils.toastMessage(error.toString());
                    });
                  },
                  title: "upload"),
            ],
          ),
        ),
      ),
    );
  }
}
