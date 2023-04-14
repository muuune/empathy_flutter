import 'package:empathy_flutter/pages/login_page.dart';
import 'package:empathy_flutter/pages/tutorial_page.dart';
import 'package:empathy_flutter/pages/worries1_page.dart';
import 'package:empathy_flutter/pages/worries2_page.dart';
import 'package:empathy_flutter/pages/worries3_page.dart';
import 'package:empathy_flutter/pages/worries4_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  static const _screens = [
    Worries1Page(),
    Worries2Page(),
    Worries3Page(),
    Worries4Page(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('マッチング一覧',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                // fontWeight: FontWeight.bold
              )),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("マッチング後の流れについて",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            )),
                        content: const Text(
                            "マッチングしたお相手と1対1のトークを、1日限りでしていただきます。\n\n1. 後日、登録時に使用したメールアドレス宛にトークルームへの招待をお送りします。\n2. 入室後は積極的なトークと、悩みへの共感をお願いします。",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                        actions: [
                          TextButton(
                            child: const Text("Cancel",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 81, 161, 101),
                                )),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text("OK",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 81, 161, 101),
                                )),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                }),
          ],
          elevation: 0.0,
          shape:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          backgroundColor: Colors.grey[50],
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.density_medium,
          //         color: Colors.black, size: 20),
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => UserPage()));
          //     },
          //   ),
          // ],
        ),
        body: _screens[_selectedIndex],
        drawer: SizedBox(
            width: 245,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                      height: 110,
                      child: DrawerHeader(
                        child: Text('メニュー'),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: const Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.2)),
                        ),
                      )),
                  ListTile(
                    leading: const Icon(Icons.fast_forward),
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: const Text('マッチング後の流れ'),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("マッチング後の流れについて",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                )),
                            content: const Text(
                                "マッチングしたお相手と1対1のトークを、1日限りでしていただきます。\n\n1. 後日、登録時に使用したメールアドレス宛にトークルームへの招待をお送りします。\n2. 入室後は積極的なトークと、悩みへの共感をお願いします。",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                )),
                            actions: [
                              TextButton(
                                child: const Text("Cancel",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 81, 161, 101),
                                    )),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: const Text("OK",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 81, 161, 101),
                                    )),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          );
                        },
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => TutorialPage()),
                      // );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.announcement),
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: const Text('当てはまる悩みがない方'),
                    ),
                    onTap: () => _openUrl(),
                  ),
                  ListTile(
                    leading: const Icon(Icons.push_pin),
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: const Text('チュートリアル画面'),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TutorialPage()),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: const Text('プライバシーポリシー'),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: const Text('ログアウト'),
                    ),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      // ログイン画面に遷移＋チャット画面を破棄
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }),
                      );
                      print('ログアウトしました');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.highlight_off),
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: const Text('退会'),
                    ),
                    onTap: () async {
                      await user?.delete();
                      await FirebaseAuth.instance.signOut();
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }),
                      );
                      print('ユーザーを削除しました');
                    },
                  ),
                  ListTile(
                    title: const Text('バージョン: 1.0.0'),
                    onTap: () {},
                  ),
                ],
              ),
            )),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(
                width: 0.2, //太さ
                color: Colors.grey, //色
              ),
            )),
            child: BottomNavigationBar(
              selectedItemColor: Colors.black,
              currentIndex: _selectedIndex,
              unselectedFontSize: 10,
              selectedFontSize: 12,
              unselectedIconTheme: const IconThemeData(
                size: 22,
              ),
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.school), label: '学業'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: '人間関係'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.cottage), label: '環境の変化'),
                BottomNavigationBarItem(icon: Icon(Icons.face), label: '自分のこと'),
              ],
              type: BottomNavigationBarType.fixed,
            )));
  }

  void _openUrl() async {
    const url = 'https://forms.gle/W9UMC2Um6vB5bvrM9'; //←ここに表示させたいURLを入力する
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }
}
