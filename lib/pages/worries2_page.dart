import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Worries2Page extends StatefulWidget {
  const Worries2Page({super.key});

  @override
  _Worries2PageState createState() => _Worries2PageState();
}

class _Worries2PageState extends State<Worries2Page> {
  var isCheck = false;
  final key = "count_key";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        FutureBuilder(
          future: getProducts_relationship(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  child: Text('1. 大学・サークル・バイト内などでの、友人関係・上下関係に悩んでいる')),
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👩‍👧‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
          future: getProducts_member(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '2. 研究室やクラスルームの先生、メンバーに不満を抱えている',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👩‍👧‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
          future: getProducts_no_friend(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '3. 大学・サークル・バイト内などで友達ができずに悩んでいる',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👩‍👧‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
          future: getProducts_family(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '4. 家族に不満を抱えている',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👩‍👧‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
          future: getProducts_sexuality(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '5. セクシャリティのことについて悩んでいる',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👩‍👧‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
          future: getProducts_broken_heart(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Text(
                        '6. 失恋から立ち直ることができない',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👩‍👧‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👭",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👥",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            // fontWeight: FontWeight.bold
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("👨‍👩‍👧",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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
                      leading: const Text("🤝",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      subtitle: Row(
                        children: const [
                          Text('人間関係に関する悩み',
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

  Future getProducts_relationship() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('友人関係・上下関係')
        .get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }

  Future getProducts_member() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('先生やメンバーへの不満')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_no_friend() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('友達ができない')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_family() async {
    var collection =
        await FirebaseFirestore.instance.collection('人間関係').doc('家族に不満').get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_sexuality() async {
    var collection = await FirebaseFirestore.instance
        .collection('人間関係')
        .doc('セクシャリティ')
        .get();
    return Future.value(collection['users'] as List);
  }

  Future getProducts_broken_heart() async {
    var collection =
        await FirebaseFirestore.instance.collection('人間関係').doc('失恋').get();
    return Future.value(collection['users'] as List);
  }
}
