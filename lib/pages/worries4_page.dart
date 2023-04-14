import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Worries4Page extends StatefulWidget {
  const Worries4Page({super.key});

  @override
  _Worries4PageState createState() => _Worries4PageState();
}

class _Worries4PageState extends State<Worries4Page> {
  var isCheck = false;
  final key = "count_key";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        FutureBuilder(
          future: getProducts_character(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '1. 自分の性格について悩んでいる',
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
                      leading: const Text("🐱",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐰",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🦊",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐻",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐼",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐸",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐨",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐶",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐱",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
          future: getProducts_process(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '2. 自分の成育過程・過程環境(トラウマなど)について悩んでいる',
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
                      leading: const Text("🐱",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐰",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🦊",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐻",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐼",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐸",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐨",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐶",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐱",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
          future: getProducts_health(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '3. 自分の身体・健康について悩んでいる',
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
                      leading: const Text("🐱",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐰",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🦊",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐻",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐼",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐸",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐨",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐶",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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
                      leading: const Text("🐱",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('自分のことに関する悩み',
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

  Future getProducts_character() async {
    var collection =
        await FirebaseFirestore.instance.collection('自分のこと').doc('自分の性格').get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }

  Future getProducts_process() async {
    var collection = await FirebaseFirestore.instance
        .collection('自分のこと')
        .doc('成育過程・過程環境')
        .get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }

  Future getProducts_health() async {
    var collection =
        await FirebaseFirestore.instance.collection('自分のこと').doc('身体・健康').get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }
}
