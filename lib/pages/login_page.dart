import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/home_page.dart';
import 'package:empathy_flutter/pages/worries1_page.dart';
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
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('指定したメールアドレスは登録済みです'),
                          ),
                        );
                        print('指定したメールアドレスは登録済みです');
                        // print('指定したメールアドレスは登録済みです');
                      } else if (e.code == 'invalid-email') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('メールアドレスのフォーマットが正しくありません'),
                          ),
                        );
                        print('メールアドレスのフォーマットが正しくありません');
                      } else if (e.code == 'operation-not-allowed') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('指定したメールアドレス・パスワードは現在使用できません'),
                          ),
                        );
                        print('指定したメールアドレス・パスワードは現在使用できません');
                      } else if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('パスワードは６文字以上にしてください'),
                          ),
                        );
                        print('パスワードは６文字以上にしてください');
                      }
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
                      } on FirebaseAuthException catch (e) {
                        // ログインに失敗した場合
                        if (e.code == 'invalid-email') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(''),
                            ),
                          );
                          print('メールアドレスのフォーマットが正しくありません');
                        } else if (e.code == 'user-disabled') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('現在指定したメールアドレスは使用できません'),
                            ),
                          );
                          print('現在指定したメールアドレスは使用できません');
                        } else if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('指定したメールアドレスは登録されていません'),
                            ),
                          );
                          print('指定したメールアドレスは登録されていません');
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('パスワードが間違っています'),
                            ),
                          );
                          print('パスワードが間違っています');
                        }
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
                      padding: const EdgeInsets.all(8),
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
  // String school_01 = "";
  // String worries02 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('悩みを登録'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CheckboxListTile(
              value: _checkBox02,
              title: const Text(
                '試験・レポート・研究等が上手く進まず、進級・卒業できるか心配である',
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _checkBox02 = value!;
                });
                if (_checkBox02 == true) {
                  //worries02 = "上下関係に悩んでいる";
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('進級・卒業')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  }); // ドキュメントID自動生成
                  //     .set({
                  //   'username': userName,
                  // });
                } else if (_checkBox02 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('進級・卒業')
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
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }),
                );
              },
              child: const Text('登録'),
            )
          ],
        ),
      ),
    );
  }
}
