import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WorriesExplanationPage extends StatefulWidget {
  const WorriesExplanationPage({super.key});

  @override
  _WorriesExplanationPage createState() => _WorriesExplanationPage();
}

class _WorriesExplanationPage extends State<WorriesExplanationPage> {
  final auth = FirebaseAuth.instance;
  late final userId = auth.currentUser?.uid;
  final TextEditingController _worriesExplanationController =
      TextEditingController();

  @override
  void dispose() {
    _worriesExplanationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      // キーボード以外をタップすると、キーボードが閉じる
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('悩みの説明の編集',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                // fontWeight: FontWeight.bold
              )),
          elevation: 0.0,
          shape:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          backgroundColor: Colors.grey[50],
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Center(
              child: Column(
                children: <Widget>[
                  const Gap(5),
                  const Text('📝 現在登録中の悩みの説明'),
                  const Gap(10),
                  FutureBuilder<String>(
                      future: getWorriesExplanation(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        // 読み込み中
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return showIndicator();
                        }
                        if (snapshot.hasData) {
                          return Container(
                            width: 500,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(snapshot.data.toString()),
                            ),
                          );
                        } else {
                          // TODO: エラー画面などにしたい
                          return Container();
                        }
                      }),
                  const Gap(20),
                  const Text('🆕 新しく登録する悩みの説明'),
                  const Gap(10),
                  TextFormField(
                    controller: _worriesExplanationController,
                    maxLines: 4,
                    minLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: '新しく登録したい、\n悩みの説明を入力してください。',
                      labelStyle: const TextStyle(
                        fontSize: 13,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const Gap(15),
                  const Text(
                    '💡 入力をせずに登録をすると、悩みの説明を削除することができます。',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(5),
                  FutureBuilder<String>(
                      future: getDisplayName(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color.fromARGB(
                                    255, 81, 161, 101), // foreground
                              ),
                              onPressed: () {
                                final worriesExplanation =
                                    _worriesExplanationController.text;
                                if (worriesExplanation != '') {
                                  Firestore.registerExplanation(
                                      snapshot.data, worriesExplanation);
                                } else {
                                  Firestore.registerExplanationEmpty(
                                      snapshot.data);
                                }
                                setState(() {
                                  successRegistration();
                                  // 入力formを空にする
                                  _worriesExplanationController.text = '';
                                });
                              },
                              child: const Text("登録"));
                        } else {
                          // TODO: エラー画面などにしたい
                          return Container();
                        }
                      }),
                  Padding(padding: EdgeInsets.only(bottom: bottomSpace)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 悩みの説明の取得
  Future<String> getWorriesExplanation() async {
    // displayNameを取得する
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final displayName = await _db.collection("uid").doc(userId).get();
    String displayNameData = displayName.data()!['displayName'];

    final snapshot =
        await _db.collection('explanation').doc(displayNameData).get();
    String snapshotData = '';
    return snapshotData = snapshot.data()!['worries_explanation'].toString();
  }

  // displayNameを取得する
  Future<String> getDisplayName() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final snapshot = await _db.collection("uid").doc(userId).get();
    String snapshotData = '';
    return snapshotData = snapshot.data()!['displayName'].toString();
  }

  void successRegistration() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            titlePadding: const EdgeInsets.only(top: 20),
            title: Image.asset(
              'images/OK.png',
              height: 180,
            ),
            content: const Text(
              '登録が完了しました！',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(
                      color: Color.fromARGB(255, 81, 161, 101), fontSize: 17),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  // 読み込み中
  Widget showIndicator() {
    return const Center(
        child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 81, 161, 101),
            )));
  }
}
