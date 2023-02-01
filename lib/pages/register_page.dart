import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {
  var _checkBox1 = false;
  var _checkBox2 = false;
  var _switchValue = true;
  var _switchTitle = 'Switch Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              value: _checkBox2,
              title: const Text(
                'Checkbox 2 Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                setState(() {
                  _checkBox2 = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
