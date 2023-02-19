import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
// textFeildController
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  // Login Method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

// Signup Method

  Future<UserCredential?> signUpMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

// Storing data method

  storeUserData({
    name,
    email,
    password,
  }) async {
    DocumentReference store = firestore.collection(usersCollection).doc(
        currentUser!.uid); //for creating a documnet into firestor with user uid
    store.set({
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': '00',
      'wishlist_count': '00',
      'order_count': '00',
    }); //to store user data on firestore
  }

// signOut Method

  signOutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
