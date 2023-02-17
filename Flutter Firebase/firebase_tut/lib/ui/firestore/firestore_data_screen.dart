import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../../utils/utils.dart";
import "../auth/login_screen.dart";
import "add_firestore_data.dart";

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
// Add firestore library

  final searchFilter = TextEditingController();
  final updateText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Firestore"),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search what you need"),
              onChanged: (String value) {
                setState(() {});
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("data"),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddFirestoreData()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) {
    updateText.text = title;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Post"),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: updateText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Update")),
          ],
        );
      },
    );
  }
}
