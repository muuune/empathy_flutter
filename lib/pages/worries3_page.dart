import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/viewModel/life/alone_data.dart';
import 'package:empathy_flutter/viewModel/life/lonely_data.dart';
import 'package:empathy_flutter/viewModel/life/noise_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Worries3Page extends StatefulWidget {
  const Worries3Page({super.key});

  @override
  _Worries3PageState createState() => _Worries3PageState();
}

class _Worries3PageState extends State<Worries3Page> {
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
          //環境の変化の質問に回答したユーザーを全て取得
          future: Future.wait([
            getProductsLonely(), //[0]
            getProductsLivingAlone(), //[1]
            getProductsNoise(), //[2]
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
                      child: Text("現在、環境の変化に関する悩みで\nマッチングはありません🏠",
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
      // 1. 親元を離れてしまったことで、寂しさ・孤独感を感じている
      FutureBuilder(
          future: getProductsLonely(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //snapshot.dataの中にdisplaynameが含まれれば表示
            //含まれなければCardも表示しない
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                if (snapshot.data.length > 1) {
                  return getProductLonelyData(displayName: displayName);
                }
              }
            }
            return Column();
          }),
      // 2. 一人暮らしを始めたが、一人で生活できるか不安だ
      FutureBuilder(
          future: getProductsLivingAlone(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                if (snapshot.data.length > 1) {
                  return getProductLivingAloneData(displayName: displayName);
                }
              }
            }
            return Column();
          }),
      // 3. 隣人の騒音に悩んでいる
      FutureBuilder(
          future: getProductsNoise(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                if (snapshot.data.length > 1) {
                  return getProductNoiseData(displayName: displayName);
                }
              }
            }
            return Column();
          }),
    ])));
  }

  Future getProductsLonely() async {
    var collection = await FirebaseFirestore.instance
        .collection('環境の変化')
        .doc('寂しさ・孤独感')
        .get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }

  Future getProductsLivingAlone() async {
    var collection = await FirebaseFirestore.instance
        .collection('環境の変化')
        .doc('一人暮らしの不安')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsNoise() async {
    var collection =
        await FirebaseFirestore.instance.collection('環境の変化').doc('騒音').get();
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
