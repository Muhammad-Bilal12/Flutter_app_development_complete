


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance; 
FirebaseFirestore firestore = FirebaseFirestore.instance;

// login User
User? currentUser = auth.currentUser;


// collection

const usersCollection = "users";

