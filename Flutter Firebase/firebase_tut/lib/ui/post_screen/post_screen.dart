import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:firebase_tut/ui/post_screen/add_post_screen.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('posts');
  final searchFilter = TextEditingController();
  final updateText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Post"),
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
                child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('msg').value.toString();

                if (searchFilter.text.isEmpty) {
                  return ListTile(
                    title: Text(snapshot.child('msg').value.toString()),
                    subtitle: Text(snapshot.child('id').value.toString()),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                showMyDialog(title,
                                    snapshot.child('id').value.toString());
                              },
                              title: const Text("Edit"),
                              leading: const Icon(Icons.edit),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              onTap: () {
                                 Navigator.pop(context);
                                daleteData(
                                    snapshot.child('id').value.toString());
                               
                              },
                              title: const Text("Delete"),
                              leading: const Icon(Icons.delete),
                            ),
                          ),
                        ];
                      },
                    ),
                  );
                } else if (title
                    .toLowerCase()
                    .contains(searchFilter.text.toLowerCase().toString())) {
                  return ListTile(
                    title: Text(snapshot.child('msg').value.toString()),
                    subtitle: Text(snapshot.child('id').value.toString()),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()));
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
                  ref.child(id).update(
                      {'msg': updateText.text.toString()}).then((value) {
                    Utils.toastMessage("Update Successfully!");
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

  Future<void> daleteData(String id) {
    return ref.child(id).remove().then((value) {
      Utils.toastMessage("Delete!");
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}

// Stream Builder Code

    // Expanded(
    //             child: StreamBuilder(
    //           stream: ref.onValue,
    //           builder: (context, snapshot) {
    //             if (!snapshot.hasData) {
    //               return const Center(
    //                 child: CircularProgressIndicator(),
    //               );
    //             } else {
    //               return ListView.builder(
    //                 itemCount: snapshot.data!.snapshot.children.length,
    //                 itemBuilder: (context, index) {
    //                   Map<dynamic, dynamic> map =
    //                       snapshot.data!.snapshot.value as dynamic;
    //                   List<dynamic> list = [];
    //                   list.clear();
    //                   list = map.values.toList();

    //                   return Card(
    //                       child: ListTile(
    //                     title: Text(list[index]['msg'].toString()),
    //                     subtitle: Text(list[index]['id'].toString()),
    //                   ));
    //                 },
    //               );
    //             }
    //           },
    //         )),
            