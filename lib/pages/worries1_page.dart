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
          //進級・卒業
          future: getProducts_grade(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
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
          //入りたい学部じゃなかった
          future: getProducts_reluctance(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
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
        ),
        FutureBuilder(
          //講義についていけない
          future: getProducts_lecture(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text('3. 大学の講義を受ける中で、ついていけないと感じることがある')),
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
          //両立が難しい
          future: getProducts_coexistence(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '4. 学業とサークル・バイトの両立が難しく悩んでいる',
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
          //大学院への進学に不安
          future: getProducts_graduate_school(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '5. 大学院に進学するべきか、就職するべきか悩んでいる',
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
          //就職先が決まらない
          future: getProducts_find_work(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '6. 周りと比べ就職先がなかなか決まらず、焦り・不安を感じている',
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
          //就職したい業界が決まらない
          future: getProducts_industry(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '7. 就職したい業界が決まらず悩んでいる',
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
          //学費・奨学金・生活費などの金銭面で悩んでいる
          future: getProducts_money(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '8. 学費・奨学金・生活費などの金銭面で悩んでいる',
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

  Future getProducts_lecture() async {
    //講義についていけない
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('講義についていけない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_coexistence() async {
    //両立が難しい
    var collection =
        await FirebaseFirestore.instance.collection('学業').doc('両立が難しい').get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_graduate_school() async {
    //大学院への進学に不安
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('大学院への進学に不安')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_find_work() async {
    //就職先が決まらない
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('就職先が決まらない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_industry() async {
    //就職したい業界が分からない
    var collection = await FirebaseFirestore.instance
        .collection('学業')
        .doc('就職したい業界が分からない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_money() async {
    //学費・奨学金・生活費などの金銭面で悩んでいる
    var collection =
        await FirebaseFirestore.instance.collection('学業').doc('金銭面').get();
    return Future.value(collection['users'] as List);
  }
}
