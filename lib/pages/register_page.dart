import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {
  String _checkBox2 = "";
  var _checkBox3 = false;

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
              value: false,
              title: const Text(
                '人間関係に悩んでいる',
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox2 = "人間関係に悩んでいる";
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox3,
              title: const Text(
                '身体的コンプレックス',
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox3 = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
