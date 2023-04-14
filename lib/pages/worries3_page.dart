import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Worries3Page extends StatefulWidget {
  const Worries3Page({super.key});

  @override
  _Worries3PageState createState() => _Worries3PageState();
}

class _Worries3PageState extends State<Worries3Page> {
  var isCheck = false;
  final key = "count_key";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        FutureBuilder(
          future: getProducts_lonely(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '1. 親元を離れてしまったことで、寂しさ・孤独感を感じている',
                      ))),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 2) //配列の長さが一定数以上であれば表示
                  // if (snapshot.data.contains(snapshot.data[10]))
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[1]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🏠",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 3) //[0][2]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[2]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      leading: const Text("📦",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 4) //[0][3]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[3]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🧹",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 5) //[0][4]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[4]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🔑",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 6) //[0][5]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[5]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🛋️",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 7) //[0][6]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[6]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🪑",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 8) //[0][7]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[7]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🏠",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 9) //[0][8]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[8]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("📦",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 6) //[0][8]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[2]}さんと${snapshot.data[5]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🧹",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
            ]);
          },
        ),
        FutureBuilder(
          future: getProducts_living_alone(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '2. 一人暮らしを始めたが、一人で生活できるか不安だ',
                      ))),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 2) //配列の長さが一定数以上であれば表示
                  // if (snapshot.data.contains(snapshot.data[10]))
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[1]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🏠",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 3) //[0][2]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[2]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      leading: const Text("📦",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 4) //[0][3]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[3]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🧹",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 5) //[0][4]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[4]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🔑",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 6) //[0][5]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[5]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🛋️",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 7) //[0][6]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[6]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🪑",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 8) //[0][7]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[7]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🏠",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 9) //[0][8]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[8]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("📦",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 6) //[0][8]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[2]}さんと${snapshot.data[5]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🧹",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
            ]);
          },
        ),
        FutureBuilder(
          future: getProducts_noise(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '3. 隣人の騒音に悩んでいる',
                      ))),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 2) //配列の長さが一定数以上であれば表示
                  // if (snapshot.data.contains(snapshot.data[10]))
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[1]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🏠",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 3) //[0][2]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[2]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      leading: const Text("📦",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 4) //[0][3]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[3]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🧹",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 5) //[0][4]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[4]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🔑",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 6) //[0][5]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[5]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🛋️",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 7) //[0][6]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[6]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🪑",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 8) //[0][7]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[7]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🏠",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 9) //[0][8]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[8]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("📦",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 6) //[0][8]
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[2]}さんと${snapshot.data[5]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🧹",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('環境の変化に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
            ]);
          },
        ),
      ]),
    ));
  }

  Future getProducts_lonely() async {
    var collection = await FirebaseFirestore.instance
        .collection('環境の変化')
        .doc('寂しさ・孤独感')
        .get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }

  Future getProducts_living_alone() async {
    var collection = await FirebaseFirestore.instance
        .collection('環境の変化')
        .doc('一人暮らしの不安')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_noise() async {
    var collection =
        await FirebaseFirestore.instance.collection('環境の変化').doc('騒音').get();
    return Future.value(collection['users'] as List);
  }
}
