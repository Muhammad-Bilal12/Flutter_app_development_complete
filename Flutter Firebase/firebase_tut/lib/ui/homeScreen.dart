import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_tut/ui/firestore/firestore_data_screen.dart";
import "package:firebase_tut/ui/post_screen/post_screen.dart";
import "package:firebase_tut/ui/upload_image/upload_image_screen.dart";
import "package:firebase_tut/widgets/rounded_btn.dart";
import "package:flutter/material.dart";

import "auth/login_screen.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
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
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundBtn(
                    title: "Firebase Database",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostScreen(),
                          ));
                    }),
                RoundBtn(
                    title: "Firebase Firestore",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirestoreScreen(),
                          ));
                    }),
                RoundBtn(
                    title: "Firebase Upload Images",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UploadImageScreen(),
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
