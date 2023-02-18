import "package:cloud_firestore/cloud_firestore.dart";
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
  final firestore = FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
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
            StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                snapshot.data!.docs[index]['users'].toString()),
                            subtitle: Text(
                                snapshot.data!.docs[index]['id'].toString()),
                            trailing: PopupMenuButton(
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      value: 1,
                                      child: ListTile(
                                        onTap: () {
                                          showMyDialog(
                                              snapshot
                                                  .data!.docs[index]['users']
                                                  .toString(),
                                              snapshot.data!.docs[index]['id']
                                                  .toString());
                                        },
                                        leading: const Icon(Icons.edit),
                                        title: const Text("Edit"),
                                      )),
                                  PopupMenuItem(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      value: 1,
                                      child: ListTile(
                                        onTap: () {
                                            Navigator.pop(context); 
                                          ref
                                              .doc(snapshot
                                                  .data!.docs[index]['id']
                                                  .toString())
                                              .delete();
                                        },
                                        leading: const Icon(Icons.delete),
                                        title: const Text("Delete"),
                                      )),
                                ];
                              },
                            ),
                          );
                        }),
                  );
                }
              },
            ),
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
                  ref.doc(id).update({
                    'users': updateText.text.toString(),
                  }).then((value) {
                    Utils.toastMessage("update");
                  }).onError((error, stackTrace) {
                    Utils.toastMessage(error.toString());
                  });
                },
                child: const Text("Update")),
          ],
        );
      },
    );
  }
}
