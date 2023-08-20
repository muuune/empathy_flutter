import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestore {
  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  static CollectionReference users = firestoreInstance.collection('users');
  static CollectionReference uid = firestoreInstance.collection('uid');
  static CollectionReference registerWorriesExplanation =
      firestoreInstance.collection('explanation');

  static Future<bool> existsUserName(userName) async {
    bool temp = false;

    //userNameが入力されていない場合、あり得ないドキュメントになるよう設定している
    if (userName == "") {
      userName = "jdfalksdjlad87389738";
    }
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

  static Future<void> registerUid(userId, email, userName) async {
    await uid.doc(userId).set({'displayName': userName, 'email': email});
  }

  // 悩みの説明がある時
  static Future<void> registerExplanation(userName, worriesExplanation) async {
    await registerWorriesExplanation
        .doc(userName)
        .set({
          'createdAt': Timestamp.now(),
          'worries_explanation': worriesExplanation,
        })
        .then((value) => print("registerExplanation"))
        .catchError((error) => print("Failed to registerExplanation: $error"));
  }

  // 悩みの説明がない時
  static Future<void> registerExplanationEmpty(userName) async {
    await registerWorriesExplanation
        .doc(userName)
        .set({
          'createdAt': Timestamp.now(),
          'worries_explanation': '現在、悩みの説明の登録がされていません',
        })
        .then((value) => print("registerExplanation"))
        .catchError((error) => print("Failed to registerExplanation: $error"));
  }
}

class matchingCard extends StatelessWidget {
  final String snapshot;
  final String pictograph;
  final String cause;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  matchingCard({
    super.key,
    required this.snapshot,
    required this.pictograph,
    // ここに要因名を入れて必須化する
    required this.cause,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final getExplanation =
            await _db.collection("explanation").doc(snapshot).get();
        final getExplanationData =
            getExplanation.data()!['worries_explanation'];
        return showExplanationDialog(
          context,
          title: snapshot + 'さんの\n' + '抱えているお悩み',
          // 半角スペースを改行に自動変換する
          content: getExplanationData.replaceAll(' ', '\n').toString(),
          onApproved: () {
            Navigator.of(context).pop();
          },
        );
      },
      child: Card(
        child: ListTile(
          title: Text("${snapshot}さんとマッチングしました",
              style: const TextStyle(
                fontSize: 15,
              )),
          leading: Text(pictograph,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              )),
          subtitle: Row(
            children: [
              Text(cause,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future showExplanationDialog(
    context, {
    required String title,
    required String content,
    required Null Function() onApproved,
  }) async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              width: 311.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey,
                          elevation: 5,
                          primary: const Color.fromARGB(255, 81, 161, 101),
                          onPrimary: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 36),
                          child: Text('確認'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
