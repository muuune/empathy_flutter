import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/firebase.dart';
import 'package:empathy_flutter/pages/login_page.dart';
import 'package:empathy_flutter/viewModel/school/coexistence_data.dart';
import 'package:empathy_flutter/viewModel/school/find_work_data.dart';
import 'package:empathy_flutter/viewModel/school/grade_data.dart';
import 'package:empathy_flutter/viewModel/school/graduate_data.dart';
import 'package:empathy_flutter/viewModel/school/industry_data.dart';
import 'package:empathy_flutter/viewModel/school/lecture_data.dart';
import 'package:empathy_flutter/viewModel/school/money_data.dart';
import 'package:empathy_flutter/viewModel/school/reluctance_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Worries1Page extends StatefulWidget {
  const Worries1Page({super.key});

  @override
  _Worries1PageState createState() => _Worries1PageState();
}

class _Worries1PageState extends State<Worries1Page> {
  var isCheck = false;
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final userId = auth.currentUser?.uid;
  String displayName = '';

  //起動時にdisplayNameを取得し、変数に代入
  @override
  void initState() {
    super.initState();
    if (userId != '') {
      getDisplayName().then((value) => displayName = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      FutureBuilder(
          //学業関係の質問に回答したユーザーを全て取得
          future: Future.wait([
            getProductsGrade(), //[0]
            getProductsReluctance(), //[1]
            getProductsLecture(), //[2]
            getProductsCoexistence(), //[3]
            getProductsGraduateSchool(), //[4]
            getProductsFindWork(), //[5]
            getProductsIndustry(), //[6]
            getProductsMoney(), //[7]
          ]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //Firestore上にログイン中のユーザーがいなければ、画面全体にテキストを表示
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data[0].contains(displayName) ||
                  snapshot.data[1].contains(displayName) ||
                  snapshot.data[2].contains(displayName) ||
                  snapshot.data[3].contains(displayName) ||
                  snapshot.data[4].contains(displayName) ||
                  snapshot.data[5].contains(displayName) ||
                  snapshot.data[6].contains(displayName) ||
                  snapshot.data[7].contains(displayName)) {
                print(snapshot.data);
              } else {
                print(snapshot.data);
                return const Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Center(
                      child: Text("現在、学業に関する悩みで\nマッチングはありません🧑‍🎓",
                          textAlign: TextAlign.center),
                    ));
              }
              return Column();
            }
            return Column();
          }),
      // 1. 試験・レポート・研究等が上手く進まず、進級・卒業できるか心配である
      FutureBuilder(
          future: getProductsGrade(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //snapshot.dataの中にdisplaynameが含まれれば表示
            //含まれなければCardも表示しない
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductGradeData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 2. 大学の講義を受ける中で、自分の入りたい学部じゃなかったと感じることがある
      FutureBuilder(
          future: getProductsReluctance(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductReluctanceData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 3. 大学の講義を受ける中で、ついていけないと感じることがある
      FutureBuilder(
          future: getProductsLecture(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductLectureData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 4. 学業とサークル・バイトの両立が難しく悩んでいる
      FutureBuilder(
          future: getProductsCoexistence(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductCoexistenceData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 5. 大学院に進学するべきか、就職するべきか悩んでいる
      FutureBuilder(
          future: getProductsGraduateSchool(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductGraduateData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 6. 周りと比べ就職先がなかなか決まらず、焦り・不安を感じている
      FutureBuilder(
          future: getProductsFindWork(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductFindWorkData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 7. 就職したい業界が決まらず悩んでいる
      FutureBuilder(
          future: getProductsIndustry(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductIndustryData(displayName: displayName);
              }
            }
            return Column();
          }),
      // 8. 学費・奨学金・生活費などの金銭面で悩んでいる
      FutureBuilder(
          future: getProductsMoney(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.contains(displayName)) {
                return getProductMoneyData(displayName: displayName);
              }
            }
            return Column();
          }),
    ])));
  }

  Future getProductsGrade() async {
    var collection =
        await FirebaseFirestore.instance.collection('学業').doc('進級・卒業').get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsReluctance() async {
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('入りたい学部じゃなかった')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsLecture() async {
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('講義についていけない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsCoexistence() async {
    var collection =
        await FirebaseFirestore.instance.collection('学業').doc('両立が難しい').get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsGraduateSchool() async {
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('大学院への進学に不安')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsFindWork() async {
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('就職先が決まらない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsIndustry() async {
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('就職したい業界が分からない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProductsMoney() async {
    var collection =
        await FirebaseFirestore.instance.collection('学業').doc('金銭面').get();
    return Future.value(collection['users'] as List);
  }

  // // displayNameを取得する
  // Future getDisplayName() async {
  //   final FirebaseFirestore _db = FirebaseFirestore.instance;
  //   final snapshot = await _db.collection("uid").doc(userId as String?).get();
  //   // snapshotDataは、ログイン中のユーザー名が格納されてる
  //   String snapshotData = '';
  //   if (userId == true) {
  //     print('trueになってます');
  //     return snapshotData = snapshot.data()!['displayName'];
  //   } else if (userId == false) {
  //     return Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginPage()),
  //     );
  //   }
  //   // print('ログイン中のユーザー' + snapshotData);
  //   // return snapshotData;
  // }

  //displayNameを取得する
  Future getDisplayName() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final snapshot = await _db.collection("uid").doc(userId).get();
    String snapshotData = '';
    print('これです' + snapshot.data().toString());
    if (snapshot.data() != null) {
      return snapshotData = snapshot.data()!['displayName'];
    }
  }
}
