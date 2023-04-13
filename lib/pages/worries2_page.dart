import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Worries1Page extends StatefulWidget {
  const Worries1Page({super.key});

  @override
  _Worries1PageState createState() => _Worries1PageState();
}

class _Worries1PageState extends State<Worries1Page> {
  var isCheck = false;
  final key = "count_key";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        FutureBuilder(
          future: getProducts_grade(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  child: Text('1. 試験・レポート・研究等が上手く進まず、進級・卒業できるか心配である')),
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
                      leading: const Text("🧑‍🎓",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
                      leading: const Text("📚",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              // チェックリストver
              // if (snapshot.connectionState == ConnectionState.done)
              //   if (snapshot.data.length >= 3)
              //     Card(
              //         child: CheckboxListTile(
              //       value: isCheck,
              //       onChanged: (bool? value) async {
              //         final pref = await SharedPreferences.getInstance();
              //         setState(() {
              //           isCheck = value!;
              //         });
              //         pref.setBool(key, value!);
              //       },
              //       title: Text(
              //         "${snapshot.data[0]}さんと${snapshot.data[2]}さんがマッチングしました",
              //         style: TextStyle(
              //           decoration: isCheck
              //               ? TextDecoration.lineThrough
              //               : TextDecoration.none,
              //         ),
              //       ),
              //       subtitle: const Text("学業に関する悩み"),
              //       secondary: const Text("🎓",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 30,
              //             // fontWeight: FontWeight.bold
              //           )),
              //       activeColor: Colors.blue,
              //     )),
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
                      leading: const Text("🎓",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
                      leading: const Text("🏫",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
                      leading: const Text("✍️",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
                      leading: const Text("📖",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
                      leading: const Text("👩‍🎓",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
                      leading: const Text("📕",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
                      leading: const Text("📕",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
          future: getProducts_reluctance(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  child: Text('2. 大学の講義を受ける中で、自分の入りたい学部じゃなかったと感じることがある')),
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
                      leading: const Text("🧑‍🎓",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),

                          // SizedBox(width: 20),
                          // Text('配列の1番目を取得'),
                        ],
                      ),
                    ),
                    // elevation: 8, // 影の離れ具合
                    // shadowColor: Colors.black, // 影の色
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 3)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[2]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("📚",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 4)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[3]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🎓",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 5)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[4]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("🏫",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 6)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[5]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("✍️",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 7)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[6]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("📖",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 8)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[7]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("👩‍🎓",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ),
              if (snapshot.connectionState == ConnectionState.done)
                if (snapshot.data.length >= 8)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[7]}さんがマッチングしました",
                          style: const TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold
                          )),
                      leading: const Text("📕",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('学業に関する悩み',
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
        )
      ]),
    ));
  }

  Future getProducts_grade() async {
    //進級・卒業
    var collection =
        await FirebaseFirestore.instance.collection('学業').doc('進級・卒業').get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }

  Future getProducts_reluctance() async {
    //入りたい学部じゃなかった
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('入りたい学部じゃなかった')
        .get();
    return Future.value(collection['users'] as List);
  }
}
