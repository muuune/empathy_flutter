import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  static CollectionReference users = firestoreInstance.collection('users');

  static Future<bool> existsUserName(userName) async {
    bool temp = false;
    userName = "jdfalksdjlad"; //あり得ないドキュメント
    await users.doc(userName).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        temp = true;
      }
    });
    return temp;
  }

  static Future<void> signUp(userName, email) async {
    await users
        .doc(userName)
        .set({'createdAt': Timestamp.now(), 'email': email})
        .then((value) => print("signUp"))
        .catchError((error) => print("Failed to singUp: $error"));
  }
}
