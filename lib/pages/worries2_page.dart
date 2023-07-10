import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/viewModel/relationship/broken_heart_data.dart';
import 'package:empathy_flutter/viewModel/relationship/family_data.dart';
import 'package:empathy_flutter/viewModel/relationship/member_data.dart';
import 'package:empathy_flutter/viewModel/relationship/no_frined_data.dart';
import 'package:empathy_flutter/viewModel/relationship/relationship_data.dart';
import 'package:empathy_flutter/viewModel/relationship/sexuality_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Worries2Page extends StatefulWidget {
  const Worries2Page({super.key});

  @override
  _Worries2PageState createState() => _Worries2PageState();
}

class _Worries2PageState extends State<Worries2Page> {
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
          //人間関係の質問に回答したユーザーを全て取得
          future: Future.wait([
            getProductsRelationship(), //[0]
            getProductsMember(), //[1]
            getProductsNoFriend(), //[2]
            getProductsFamily(), //[3]
            getProductsSexuality(), //[4]
            getProductsBrokenHeart(), //[5]
          ]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //Firestore上にログイン中のユーザーがいなければ、画面全体にテキストを表示
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data[0].contains(displayName) ||
                  snapshot.data[1].contains(displayName) ||
                  snapshot.data[2].contains(displayName) ||
                  snapshot.data[3].contains(displayName) ||
                  snapshot.data[4].contains(displayName) ||
                  snapshot.data[5].contains(displayName)) {
                print(snapshot.data);
              } else {
                print(snapshot.data);
                return const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Center(
                      child: Text("現在、人間関係に関する悩みで\nマッチングはありません👭",
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
      // 1. 大学・サークル・バイト内などでの、友人関係・上下関係に悩んでいる
      FutureBuilder(
          future: getProductsRelationship(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //snapshot.dataの中にdisplaynameが含まれれば表示
            //含まれなければCardも表示しない
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductRelationshipData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 2. 研究室やクラスルームの先生、メンバーに不満を抱えている
      FutureBuilder(
          future: getProductsMember(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductMemberData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 3. 大学・サークル・バイト内などで友達ができずに悩んでいる
      FutureBuilder(
          future: getProductsNoFriend(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductNoFriendData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 4. 家族に不満を抱えている
      FutureBuilder(
          future: getProductsFamily(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductFamilyData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 5. セクシャリティのことについて悩んでいる
      FutureBuilder(
          future: getProductsSexuality(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductSexualityData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 6. 失恋から立ち直ることができない
      FutureBuilder(
          future: getProductsBrokenHeart(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductBrokenHeartData(displayName: displayName);
              }
            }
            return Column();
          }),
    ])));
  }

  Future getProductsRelationship() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('友人関係・上下関係')
        .get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }

  Future getProductsMember() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('先生やメンバーへの不満')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsNoFriend() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('友達ができない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsFamily() async {
    var collection =
        await FirebaseFirestore.instance.collection('人間関係').doc('家族に不満').get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsSexuality() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('セクシャリティ')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsBrokenHeart() async {
    var collection =
        await FirebaseFirestore.instance.collection('人間関係').doc('失恋').get();
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
