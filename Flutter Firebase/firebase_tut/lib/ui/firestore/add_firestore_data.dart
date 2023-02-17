import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/rounded_btn.dart';

class AddFirestoreData extends StatefulWidget {
  const AddFirestoreData({super.key});

  @override
  State<AddFirestoreData> createState() => _AddFirestoreDataState();
}

class _AddFirestoreDataState extends State<AddFirestoreData> {
  bool loading = false;
  final userController = TextEditingController();
  // This is firestore class instance which store data collection
  final firestore = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firesore Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextFormField(
              controller: userController,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Share what is in your mind!"),
            ),
            const SizedBox(height: 20),
            RoundBtn(
                title: "Add",
                loading: loading,
                onPress: () {
                  setState(() {
                    loading = true;
                  });
                  // CALL TO SET DATA ON FIREBASE REALTIME
                  String id = DateTime.now().microsecondsSinceEpoch.toString();
                  firestore.doc(id).set({
                    'id': id,
                    'users': userController.text.toString()
                  }).then((value) {
                      setState(() {
                    loading = false;
                  });
                    Utils.toastMessage("Added");
                  }).onError((error, stackTrace) {
                      setState(() {
                    loading = false;
                  });
                    Utils.toastMessage(error.toString());
                  });

                  debugPrint("add Data");
                  userController.clear();
                })
          ],
        ),
      ),
    );
  }
}
