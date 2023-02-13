import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FutureBuilder Demo'),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getProducts(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Column(children: [
                if (snapshot.data.length >= 2) //配列の長さが一定数以上であれば表示
                  // if (snapshot.data.contains(snapshot.data[10]))
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[1]}さんがマッチングしました"),
                      leading: Icon(Icons.face),
                      subtitle: Row(
                        children: const [
                          Text('配列の0番目を取得'),
                          SizedBox(width: 20),
                          Text('配列の1番目を取得'),
                        ],
                      ),
                    ),
                    elevation: 8, // 影の離れ具合
                    shadowColor: Colors.black, // 影の色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                if (snapshot.data.length >= 3)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[2]}さんがマッチングしました"),
                      leading: Icon(Icons.face),
                      subtitle: Row(
                        children: const [
                          Text('配列の0番目を取得'),
                          SizedBox(width: 20),
                          Text('配列の1番目を取得'),
                        ],
                      ),
                    ),
                    elevation: 8, // 影の離れ具合
                    shadowColor: Colors.black, // 影の色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                if (snapshot.data.length >= 4)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[3]}さんがマッチングしました"),
                      leading: Icon(Icons.face),
                      subtitle: Row(
                        children: const [
                          Text('配列の0番目を取得'),
                          SizedBox(width: 20),
                          Text('配列の1番目を取得'),
                        ],
                      ),
                    ),
                    elevation: 8, // 影の離れ具合
                    shadowColor: Colors.black, // 影の色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                if (snapshot.data.length >= 5)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[4]}さんがマッチングしました"),
                      leading: Icon(Icons.face),
                      subtitle: Row(
                        children: const [
                          Text('配列の0番目を取得'),
                          SizedBox(width: 20),
                          Text('配列の1番目を取得'),
                        ],
                      ),
                    ),
                    elevation: 8, // 影の離れ具合
                    shadowColor: Colors.black, // 影の色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                if (snapshot.data.length >= 6)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[5]}さんがマッチングしました"),
                      leading: Icon(Icons.face),
                      subtitle: Row(
                        children: const [
                          Text('配列の0番目を取得'),
                          SizedBox(width: 20),
                          Text('配列の1番目を取得'),
                        ],
                      ),
                    ),
                    elevation: 8, // 影の離れ具合
                    shadowColor: Colors.black, // 影の色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                if (snapshot.data.length >= 7)
                  Card(
                    child: ListTile(
                      title: Text(
                          "${snapshot.data[0]}さんと${snapshot.data[6]}さんがマッチングしました"),
                      leading: Icon(Icons.face),
                      subtitle: Row(
                        children: const [
                          Text('配列の0番目を取得'),
                          SizedBox(width: 20),
                          Text('配列の1番目を取得'),
                        ],
                      ),
                    ),
                    elevation: 8, // 影の離れ具合
                    shadowColor: Colors.black, // 影の色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              ]);

              // Text("${snapshot.data}");
              // if (snapshot.hasData) {
              //   return Text(
              //       "${snapshot.data[0]}さんと${snapshot.data[1]}さんがマッチングしました");
              // } else {
              //   return Text("データが存在しません");
              // }
            },
          ),
        ));
  }

  Future getProducts() async {
    var collection = await FirebaseFirestore.instance
        .collection('worries_users')
        .doc('worries id 2')
        .get();
    // var products = collection['users'] as List;
    return Future.value(collection['users'] as List);
  }
}
