import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/viewModel/myself/character_data.dart';
import 'package:empathy_flutter/viewModel/myself/health_data.dart';
import 'package:empathy_flutter/viewModel/myself/process_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Worries4Page extends StatefulWidget {
  const Worries4Page({super.key});

  @override
  _Worries4PageState createState() => _Worries4PageState();
}

class _Worries4PageState extends State<Worries4Page> {
  var isCheck = false;
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final userId = auth.currentUser?.uid.toString();
  String displayName = '';

  //起動時にdisplayNameを取得し、変数に代入
  @override
  void initState() {
    super.initState();
    getDisplayName().then((value) => displayName = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      FutureBuilder(
          // 自分のことの質問に回答したユーザーを全て取得
          future: Future.wait([
            getProductsCharacter(), //[0]
            getProductsProcess(), //[1]
            getProductsHealth(), //[2]
          ]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //Firestore上にログイン中のユーザーがいなければ、画面全体にテキストを表示
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data[0].contains(displayName) &&
                      snapshot.data[0].length > 1 ||
                  snapshot.data[1].contains(displayName) &&
                      snapshot.data[1].length > 1 ||
                  snapshot.data[2].contains(displayName) &&
                      snapshot.data[2].length > 1) {
                print(snapshot.data);
              } else {
                print('マッチングはありません');
                return const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Center(
                      child: Text("現在、自分のことに関する悩みで\nマッチングはありません🐱",
                          textAlign: TextAlign.center),
                    ));
              }
              return Column();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return showIndicator();
            }
            return Column();
          }),
      // 1. 自分の性格について悩んでいる
      FutureBuilder(
          future: getProductsCharacter(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //snapshot.dataの中にdisplaynameが含まれれば表示
            //含まれなければCardも表示しない
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                if (snapshot.data.length > 1) {
                  return getProductCharacterData(displayName: displayName);
                }
              }
            }
            return Column();
          }),
      // 2. 自分の成育過程・家庭環境(トラウマなど)について悩んでいる
      FutureBuilder(
          future: getProductsProcess(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                if (snapshot.data.length > 1) {
                  return getProductProcessData(displayName: displayName);
                }
              }
            }
            return Column();
          }),
      // 3. 自分の身体・健康について悩んでいる
      FutureBuilder(
          future: getProductsHealth(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                if (snapshot.data.length > 1) {
                  return getProductHealthData(displayName: displayName);
                }
              }
            }
            return Column();
          })
    ])));
  }

  Future getProductsCharacter() async {
    var collection =
        await FirebaseFirestore.instance.collection('自分のこと').doc('自分の性格').get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsProcess() async {
    var collection = await FirebaseFirestore.instance
        .collection('自分のこと')
        .doc('成育過程・過程環境')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsHealth() async {
    var collection =
        await FirebaseFirestore.instance.collection('自分のこと').doc('身体・健康').get();
    return Future.value(collection['users'] as List);
  }

  //displayNameを取得する
  Future getDisplayName() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final snapshot = await _db.collection("uid").doc(userId).get();
    final snapshotData = snapshot.data()!['displayName'];
    print('ログイン中のユーザー' + snapshotData);
    return snapshotData;
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
