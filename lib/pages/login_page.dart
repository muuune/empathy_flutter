import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// ログイン画面用Widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String infoText = ''; // メッセージ表示用
  String username = ''; // ニックネーム
  String email = ''; // 入力したメールアドレス・パスワード
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'ニックネーム'),
                onChanged: (String value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              // メールアドレス入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(infoText),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('ユーザー登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final result = await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ユーザー登録に成功した場合
                      // チャット画面に遷移＋ログイン画面を破棄
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return RegisterWorriesPage(result.user!);
                        }),
                      );
                    } catch (e) {
                      // ユーザー登録に失敗した場合
                      setState(() {
                        infoText = "登録に失敗しました：${e.toString()}";
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                  width: double.infinity,
                  // ログイン登録ボタン
                  child: OutlinedButton(
                    child: const Text('ログイン'),
                    onPressed: () async {
                      try {
                        // メール/パスワードでログイン
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final result = await auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        // ログインに成功した場合
                        // チャット画面に遷移＋ログイン画面を破棄
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return const HomePage();
                          }),
                        );
                      } catch (e) {
                        // ログインに失敗した場合
                        setState(() {
                          infoText = "ログインに失敗しました：${e.toString()}";
                        });
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterWorriesPage extends StatefulWidget {
  RegisterWorriesPage(this.user);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user;
  @override
  State<StatefulWidget> createState() {
    return _RegisterWorriesPage();
  }
}

class _RegisterWorriesPage extends State<RegisterWorriesPage> {
  String userName = ""; //ユーザー名
  var _checkBox01 = false;
  var _checkBox02 = false;
  String worries01 = ""; //人間関係の悩み
  String worries02 = ""; //上下関係の悩み

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'ユーザー名'),
              onChanged: (String value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox01,
              title: const Text(
                '人間関係に悩んでいる',
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox01 = value!;
                });
                if (_checkBox01 == true) {
                  worries01 = "人間関係に悩んでいる";
                } else if (_checkBox01 == false) {
                  worries01 = "";
                }
              },
            ),
            CheckboxListTile(
              value: _checkBox02,
              title: const Text(
                '上下関係に悩んでいる',
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _checkBox02 = value!;
                });
                if (_checkBox02 == true) {
                  worries02 = "上下関係に悩んでいる";
                  await FirebaseFirestore.instance
                      .collection('worries_users') // コレクションID指定
                      .doc('worries id 2')
                      .update({
                    "users": FieldValue.arrayUnion([userName])
                  }); // ドキュメントID自動生成
                  //     .set({
                  //   'username': userName,
                  // });
                } else if (_checkBox02 == false) {
                  await FirebaseFirestore.instance
                      .collection('worries_users') // コレクションID指定
                      .doc('worries id 2')
                      .update({
                    "users": FieldValue.arrayRemove([userName])
                  });
                  //worries02 = "";
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final date = DateTime.now().toLocal().toIso8601String();
                final uuid = widget.user.uid;
                final email = widget.user.email; //ログインしているユーザーのuidを取得
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID指定
                    .doc(uuid) // ドキュメントID自動生成
                    .set({
                  'username': userName,
                  'date': date,
                  'email': email,
                  'worries01': worries01,
                  'worries02': worries02,
                });
              },
              child: const Text('登録'),
            )
          ],
        ),
      ),
    );
  }
}
