import 'package:empathy_flutter/home_page.dart';
import 'package:empathy_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          // when user select SKIP
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const MyApp();
            }),
          );
        },
        finishCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const MyApp();
            }),
          );
          // Navigator.pop(context);
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Colors.white,
        imageAssetPath: 'images/welcome.png',
        title: 'ココロノミカタへようこそ',
        body: '細かい説明をbodyに指定して書くことが出来ます',
        doAnimateImage: true),
    // PageModel(
    //     color: const Color(0xFF9B90BC),
    //     imageAssetPath: 'assets/1.png',
    //     title: '左右のスワイプ',
    //     body: 'NEXTを押さなくても左右にスワイプすることで画面の切替が出来ます',
    //     doAnimateImage: true),
    PageModel.withChild(
        child: const Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Text(
              "さあ、始めましょう",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            )),
        color: const Color(0xFF5886d6),
        doAnimateChild: true),
    PageModel.withChild(
        child: const Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Text(
              "さあ、始めましょう2",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            )),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];
}
