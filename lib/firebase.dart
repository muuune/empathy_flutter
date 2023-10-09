import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firestore {
  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  static CollectionReference users = firestoreInstance.collection('users');
  static CollectionReference uid = firestoreInstance.collection('uid');
  static CollectionReference registerWorriesExplanation =
      firestoreInstance.collection('explanation');
  static CollectionReference registerConfirmWorries =
      firestoreInstance.collection('confirmWorries');

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
          'worries_explanation': '$userNameさんは、悩みの登録はしていますが、悩みの説明の登録はしていません。',
        })
        .then((value) => print("registerExplanation"))
        .catchError((error) => print("Failed to registerExplanation: $error"));
  }

  // ユーザーが登録してる悩みの一覧を保存するために、ユーザー名のドキュメントを作成する
  // updateではdocの場所も指定しないといけないため、別でsetを行う必要がある
  static Future<void> registerUserDoc(userName) async {
    await registerConfirmWorries.doc(userName).set({
      'createdAt': Timestamp.now(),
    });
  }

  // チェックされている悩みを登録する(ユーザーが登録してる悩みを一覧でまとめる用)
  static Future<void> registerUserConfirmWorries(userName, checkedList) async {
    await registerConfirmWorries.doc(userName).update({
      "worries": FieldValue.arrayUnion([checkedList])
    });
  }

  // チェックされている悩みを削除する(ユーザーが登録してる悩みを一覧でまとめる用)
  static Future<void> deleteUserConfirmWorries(userName, checkedList) async {
    await registerConfirmWorries.doc(userName).update({
      "worries": FieldValue.arrayRemove([checkedList])
    });
  }
}

class matchingCard extends StatelessWidget {
  final String snapshot;
  final String pictograph;
  final String cause;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late final userId = auth.currentUser?.uid;

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
        // 登録した悩みを表示する時は、下のコメントアウトを外す。
        // final getRegisterWorries =
        //     await _db.collection('confirmWorries').doc(snapshot).get();
        // final getRegisterWorriesData = getRegisterWorries['worries'] as List;
        return showExplanationDialog(
          context,
          title: snapshot + 'さんの\n' + '抱えているお悩み',
          // registerWorries: getRegisterWorriesData,
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
                  style: const TextStyle(
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
    // required List<dynamic> registerWorries,
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
                  // const Padding(
                  //   padding: EdgeInsets.only(bottom: 5.0),
                  //   child: Text(
                  //     '登録している悩み',
                  //     style: TextStyle(
                  //       decoration: TextDecoration.underline,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: FutureBuilder(builder:
                  //       (BuildContext context, AsyncSnapshot snapshot) {
                  //     // 読み込み中
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return showIndicator();
                  //     }
                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         if (registerWorries.isEmpty)
                  //           const Padding(
                  //             padding: EdgeInsets.all(15),
                  //             child: Text(
                  //               '登録している悩みはありません。',
                  //             ),
                  //           ),
                  //         if (registerWorries.isNotEmpty &&
                  //             registerWorries[0] != null)
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 7, horizontal: 15),
                  //             child: Text(
                  //               '1. ${registerWorries[0]}',
                  //             ),
                  //           ),
                  //         if (registerWorries.length >= 2 &&
                  //             registerWorries[1] != null)
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 7, horizontal: 15),
                  //             child: Text(
                  //               '2. ${registerWorries[1]}',
                  //             ),
                  //           ),
                  //         if (registerWorries.length >= 3 &&
                  //             registerWorries[2] != null)
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 7, horizontal: 15),
                  //             child: Text(
                  //               '3. ${registerWorries[2]}',
                  //             ),
                  //           ),
                  //         if (registerWorries.length >= 4 &&
                  //             registerWorries[3] != null)
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 7, horizontal: 15),
                  //             child: Text(
                  //               '4. ${registerWorries[3]}',
                  //             ),
                  //           ),
                  //       ],
                  //     );
                  //   }),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 10.0),
                  //   child: Text(
                  //     '登録している悩みの説明',
                  //     style: TextStyle(
                  //       decoration: TextDecoration.underline,
                  //     ),
                  //   ),
                  // ),
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
                              vertical: 12, horizontal: 20),
                          child: Text('閉じる'),
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

// 読み込み中
  // Widget showIndicator() {
  //   return const Center(
  //       child: Padding(
  //           padding: EdgeInsets.only(top: 70),
  //           child: CircularProgressIndicator(
  //             color: Color.fromARGB(255, 81, 161, 101),
  //           )));
  // }
}
