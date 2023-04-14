import 'package:empathy_flutter/pages/login_page.dart';
import 'package:empathy_flutter/pages/worries1_page.dart';
import 'package:empathy_flutter/pages/worries2_page.dart';
import 'package:empathy_flutter/pages/worries3_page.dart';
import 'package:empathy_flutter/pages/worries4_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
}
