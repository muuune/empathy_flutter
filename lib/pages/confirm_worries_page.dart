import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmWorriesPage extends StatefulWidget {
  const ConfirmWorriesPage({super.key});

  @override
  _ConfirmWorriesPage createState() => _ConfirmWorriesPage();
}

class _ConfirmWorriesPage extends State<ConfirmWorriesPage> {
  final auth = FirebaseAuth.instance;
  late final userId = auth.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('登録した悩みの確認',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            )),
        elevation: 0.0,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
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
                const Text('📝 現在登録中の悩み'),
                const Gap(10),
                Container(
                  width: 500,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FutureBuilder(
                      future: getConfirmWorries(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        // 読み込み中
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return showIndicator();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (snapshot.data.length == 0)
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  '登録している悩みはありません。',
                                ),
                              ),
                            if (snapshot.data.length >= 1 &&
                                snapshot.data[0] != null)
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 15),
                                    child: Text(
                                      '1️. ${snapshot.data[0]}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            if (snapshot.data.length >= 2 &&
                                snapshot.data[1] != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                child: Text(
                                  '2️. ${snapshot.data[1]}',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                            if (snapshot.data.length >= 3 &&
                                snapshot.data[2] != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                child: Text(
                                  '3️. ${snapshot.data[2]}',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ),
                          ],
                        );
                      }),
                ),
                const Gap(20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          const Color.fromARGB(255, 81, 161, 101), // foreground
                    ),
                    onPressed: () async {
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }),
                      );
                    },
                    child: const Text("ホームに戻る")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ユーザーが登録している悩みの一覧を取得する
  Future getConfirmWorries() async {
    // displayNameを取得する
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final displayName = await _db.collection("uid").doc(userId).get();
    String displayNameData = displayName.data()!['displayName'];

    final snapshot =
        await _db.collection('confirmWorries').doc(displayNameData).get();
    return Future.value(snapshot['worries'] as List);
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
