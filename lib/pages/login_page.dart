import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empathy_flutter/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var _school01 = false;
  var _school02 = false;
  var _school03 = false;
  var _school04 = false;
  var _school05 = false;
  var _school06 = false;
  var _school07 = false;
  var _school08 = false;
  var _school09 = false;
  var _school10 = false;
  var _relationship01 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('悩みを登録する',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              // fontWeight: FontWeight.bold
            )),
        elevation: 0.0,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                child: Text('🎓 学業に関する悩み',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      // fontWeight: FontWeight.bold
                    ))),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              height: 0,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            CheckboxListTile(
              value: _school01,
              title: const Text('試験・レポート・研究等が上手く進まず、進級・卒業できるか心配である',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school01 = value!;
                });
                if (_school01 == true) {
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
                } else if (_school02 == false) {
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
            CheckboxListTile(
              value: _school02,
              title: const Text('大学の講義を受ける中で、自分の入りたい学部じゃなかったと感じることがある',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school02 = value!;
                });
                if (_school02 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('入りたい学部じゃなかった')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school02 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('入りたい学部じゃなかった')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school03,
              title: const Text('大学の講義を受ける中で、ついていけないと感じることがある',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school03 = value!;
                });
                if (_school03 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('講義についていけない')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school03 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('講義についていけない')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school04,
              title: const Text('学業とサークル・バイトの両立が難しく悩んでいる',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school04 = value!;
                });
                if (_school04 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('両立が難しい')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school04 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('両立が難しい')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school05,
              title: const Text('大学院に進学すべきか、就職するべきか悩んでいる',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school05 = value!;
                });
                if (_school05 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('大学院への進学に不安')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school05 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('大学院への進学に不安')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school06,
              title: const Text('周りと比べ就職先がなかなか決まらず、焦り・不安を感じている',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school06 = value!;
                });
                if (_school06 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('就職先が決まらない')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school06 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('就職先が決まらない')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school07,
              title: const Text('就職したい業界が決まらず悩んでいる',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school07 = value!;
                });
                if (_school07 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('就職したい業界が分からない')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school07 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('就職したい業界が分からない')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school08,
              title: const Text('学費などの学納金について悩んでいる',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school08 = value!;
                });
                if (_school08 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('学納金')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school08 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('学納金')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school09,
              title: const Text('生活費について悩んでいる',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school09 = value!;
                });
                if (_school09 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('生活費')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school09 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('生活費')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            CheckboxListTile(
              value: _school10,
              title: const Text('奨学金について悩んでいる',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _school10 = value!;
                });
                if (_school10 == true) {
                  await FirebaseFirestore.instance
                      .collection('学業') // コレクションID指定
                      .doc('奨学金')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  });
                } else if (_school10 == false) {
                  await FirebaseFirestore.instance
                      .collection('学業')
                      .doc('奨学金')
                      .update({
                    "users": FieldValue.arrayRemove([widget.userNameText])
                  });
                }
              },
            ),
            const Padding(
                padding:
                    EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                child: Text('👫 人間関係に関する悩み',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      // fontWeight: FontWeight.bold
                    ))),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              height: 0,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            CheckboxListTile(
              value: _relationship01,
              title: const Text('大学・サークル・バイト内などでの友人関係・上下関係に悩んでいる',
                  style: TextStyle(
                    fontSize: 13,
                  )),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) async {
                setState(() {
                  _relationship01 = value!;
                });
                if (_relationship01 == true) {
                  //worries02 = "上下関係に悩んでいる";
                  await FirebaseFirestore.instance
                      .collection('人間関係') // コレクションID指定
                      .doc('友人関係・上下関係')
                      .update({
                    "users": FieldValue.arrayUnion([widget.userNameText])
                  }); // ドキュメントID自動生成
                  //     .set({
                  //   'username': userName,
                  // });
                } else if (_relationship01 == false) {
                  await FirebaseFirestore.instance
                      .collection('人間関係') // コレクションID指定
                      .doc('友人関係・上下関係')
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
              child: const Text('マッチング一覧画面へ'),
            )
          ],
        ),
      ),
    );
  }
}
