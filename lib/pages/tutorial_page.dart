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
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/logo.png',
        title: 'アナタノミカタへ\nようこそ！',
        body: 'このアプリでは、あなたと同じ悩みを抱える方と繋がることができます。\n流れを簡単に説明していきます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 69, 142, 88),
        imageAssetPath: 'images/registerpage.png',
        title: '1. 悩みを登録',
        body: 'あなたの悩みに該当する項目を選択することで、悩みを登録していきます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/homepage_sample01.png',
        title: '2. 同じ悩みを抱える相手を表示',
        body: 'マッチング相手をタップすると、悩みの説明を見ることができます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 69, 142, 88),
        imageAssetPath: 'images/line_openchat.png',
        title: '3. LINEのオープンチャットで一日限りのトーク',
        body: 'マッチングした相手と1対1で、一日限りのトークをしていただきます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/OK.png',
        title: '⚠️ トーク時の注意',
        body: 'トークは一日限りのため、積極的な交流をお願いします。\nまた、トーク時は相手の悩みに共感するよう心がけましょう！',
        doAnimateImage: true),
    // PageModel.withChild(
    //     child: const Padding(
    //         padding: EdgeInsets.only(bottom: 25.0),
    //         child: Text(
    //           "さあ、始めましょう",
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 32,
    //           ),
    //         )),
    //     color: const Color(0xFF5886d6),
    //     doAnimateChild: true),
  ];
}
