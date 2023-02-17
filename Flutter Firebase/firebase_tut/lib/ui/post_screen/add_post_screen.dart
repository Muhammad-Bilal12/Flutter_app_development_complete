import "package:firebase_database/firebase_database.dart";
import "package:firebase_tut/widgets/rounded_btn.dart";
import "package:flutter/material.dart";

import "../../utils/utils.dart";

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final postController = TextEditingController();

  // in firebase we called it nodes
  final databaseRefs = FirebaseDatabase.instance.ref(
      'posts'); //this will create table refernce on firebase which called 'post'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextFormField(
              controller: postController,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Share what is in your mind!"),
            ),
            const SizedBox(height: 20),
            RoundBtn(
                title: "Post",
                loading: loading,
                onPress: () {
                  setState(() {
                    loading = true;
                  });
                  // CALL TO SET DATA ON FIREBASE REALTIME
                  String id = DateTime.now().millisecondsSinceEpoch.toString(); 
                  databaseRefs
                      .child(id)
                      .set({
                    'id': id,
                    'msg': postController.text.toString(),
                  }).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils.toastMessage("Post Added Successfully");
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    Utils.toastMessage(error.toString());
                  });
                  debugPrint("add Data");
                  postController.clear();
                })
          ],
        ),
      ),
    );
  }
}
