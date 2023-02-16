import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:empathy_flutter/firebase.dart';

// ログイン画面用Widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String infoText = ''; // メッセージ表示用
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
                          return SignUpPage(result.user!);
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

// class RegisterNamePage extends StatefulWidget {
//   RegisterNamePage(this.user);
//   final User user;
//   @override
//   _RegisterNamePage createState() => _RegisterNamePage();
// }

// class _RegisterNamePage extends State<RegisterNamePage> {
//   String username = ''; // ニックネーム
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Container(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         child: Text("${widget.user.email}"),
//                       ),
//                       TextFormField(
//                         decoration: const InputDecoration(labelText: 'ニックネーム'),
//                         onChanged: (String value) {
//                           setState(() {
//                             username = value;
//                           });
//                         },
//                         validator: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'ユーザー名を入力してください';
//                           } else if () {
//                             return 'そのユーザー名は使用されています';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           child: const Text('ニックネーム登録'),
//                           onPressed: () async {},
//                         ),
//                       ),
//                     ]))));
//   }
// }

class SignUpPage extends StatefulWidget {
  SignUpPage(this.user);
  final User user;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _existsUserName = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('悩みを登録'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text("${widget.user.email}"),
                    ),
                    TextFormField(
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        hintText: 'ユーザー名',
                      ),
                      maxLength: 15,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) async {
                        _existsUserName = await Firestore.existsUserName(value);
                        _formKey.currentState!.validate();
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'ユーザー名を入力してください';
                        } else if (_existsUserName) {
                          return 'そのユーザー名は使用されています';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          final userNameText = _userNameController.text;
                          final email = widget.user.email;
                          if (_formKey.currentState!.validate()) {
                            if (!_existsUserName) {
                              await Firestore.signUp(
                                  _userNameController.text, email);
                              await Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  return RegisterWorriesPage(userNameText);
                                }),
                              );
                            }
                            print(_nameController.text);
                            print(_userNameController.text);
                          }
                        },
                        child: const Text('登録'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterWorriesPage extends StatefulWidget {
  RegisterWorriesPage(this.userNameText);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String userNameText;
  @override
  State<StatefulWidget> createState() {
    return _RegisterWorriesPage();
  }
}

class _RegisterWorriesPage extends State<RegisterWorriesPage> {
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
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  }); // ドキュメントID自動生成
                  //     .set({
                  //   'username': userName,
                  // });
                } else if (_checkBox02 == false) {
                  await FirebaseFirestore.instance
                      .collection('worries_users') // コレクションID指定
                      .doc('worries id 2')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                    // "users": FieldValue.arrayRemove([userName])
                  });
                  //worries02 = "";
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                // final date = DateTime.now().toLocal().toIso8601String();
                // // final uuid = widget.user.uid;
                // // final email = widget.user.email; //ログインしているユーザーのuidを取得
                // await FirebaseFirestore.instance
                //     .collection('users') // コレクションID指定
                //     .doc(uuid) // ドキュメントID自動生成
                //     .set({
                //   'username': userName,
                //   'date': date,
                //   'email': email,
                //   'worries01': worries01,
                //   'worries02': worries02,
                // });
              },
              child: const Text('登録'),
            )
          ],
        ),
      ),
    );
  }
}
