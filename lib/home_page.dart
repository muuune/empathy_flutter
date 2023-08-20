import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/pages/login_page.dart';
import 'package:empathy_flutter/pages/tutorial_page.dart';
import 'package:empathy_flutter/pages/worries1_page.dart';
import 'package:empathy_flutter/pages/worries2_page.dart';
import 'package:empathy_flutter/pages/worries3_page.dart';
import 'package:empathy_flutter/pages/worries4_page.dart';
import 'package:empathy_flutter/pages/worries_%20explanation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final auth = FirebaseAuth.instance;
  late final userId = auth.currentUser?.uid.toString();
  String displayName = '';

  @override
  void initState() {
    print(userId);
    super.initState();
    if (userId != '') {
      getDisplayName().then((value) => displayName = value);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => showAttentionDialog());
  }

  //displayNameを取得する
  // void test() async {
  //   final FirebaseFirestore _db = FirebaseFirestore.instance;
  //   final snapshot = await _db.collection("uid").doc(userId).get();
  //   final displayName = snapshot.data()!['displayName'];
  //   print(displayName);
  // }

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
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  showAttentionDialog();
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
                  const Gap(60),
                  const Padding(
                      padding: EdgeInsets.only(left: 15), child: Text('メニュー')),
                  const Gap(10),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Wrap(
                      children: [
                        const Icon(Icons.account_circle),
                        const Gap(12),
                        Text('   $displayNameさん'),
                      ],
                    ),
                  ),
                  const Gap(25),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.4,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //     height: 110,
                  //     child: DrawerHeader(
                  //       child: const Text('メニュー'),
                  //       decoration: BoxDecoration(
                  //         color: Colors.grey[50],
                  //         border: const Border(
                  //             bottom:
                  //                 BorderSide(color: Colors.grey, width: 0.2)),
                  //       ),
                  //     )),
                  const Gap(10),
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: const Text('悩みの説明を編集する'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const WorriesExplanationPage()),
                      );
                    },
                  ),
                  // ListTile(
                  //   leading: const Icon(Icons.fast_forward),
                  //   title: Transform.translate(
                  //     offset: const Offset(-20, 0),
                  //     child: const Text('マッチング後の流れ'),
                  //   ),
                  //   onTap: () {
                  //     showAttentionDialog();
                  //   },
                  // ),
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
                    onTap: () => _openPrivacyPolicy(),
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
    const url = 'https://forms.gle/W9UMC2Um6vB5bvrM9';
    if (await canLaunch(url)) {
      await launch(
        url,
        // iOSでアプリ内かブラウザのどちらかでURLを開くか決める。
        forceSafariVC: true,
        // Androidでアプリ内かブラウザのどちらかでURLを開くか決める。
        forceWebView: false,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  void _openPrivacyPolicy() async {
    const url =
        'https://adorable-volcano-5e9.notion.site/d16800abf38b42088203f5e6f998269a';
    if (await canLaunch(url)) {
      await launch(
        url,
        // iOSでアプリ内かブラウザのどちらかでURLを開くか決める。
        forceSafariVC: true,
        // Androidでアプリ内かブラウザのどちらかでURLを開くか決める。
        forceWebView: false,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  Future showAttentionDialog() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              width: 311.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Gap(10),
                  const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'マッチング後の流れについて',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'マッチングした相手と1対1のトークを、1日限りでしていただきます。\n\n1. 後日、登録時に使用したメールアドレス宛にトークルームの招待をお送りします。\n\n2. 入室後は積極的なトークと、悩みへの共感をお願いします。',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 81, 161, 101),
                          shadowColor: Colors.grey,
                          elevation: 5,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 36),
                          child: Text('確認'),
                        ),
                      ),
                    ],
                  ),
                  const Gap(35),
                ],
              ),
            ),
          );
        });
  }

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
