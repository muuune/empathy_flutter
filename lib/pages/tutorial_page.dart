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
        color: Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/Handshake_Outline.png',
        title: 'アナタノミカタへようこそ！',
        body: 'このアプリでは、あなたと同じ悩みを抱える人と繋がることができます。',
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 69, 142, 88),
        imageAssetPath: 'images/Checklist_Outline.png',
        title: '1. あなたのお悩みを登録',
        body: 'ユーザー登録時に、あなたの悩みに該当する項目を選択していただくことで、悩みを登録していきます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/Network _Outline.png',
        title: '2. あなたと同じ悩みを抱えるお相手が表示',
        body: '4つの悩み要因ごとに、同じ悩みを抱えるお相手が表示されます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 69, 142, 88),
        imageAssetPath: 'images/Conversation _Outline.png',
        title: '3. LINEのオープンチャットで1日限りのトーク',
        body: 'マッチングしたお相手と1対1で、1日限りのトークをしていただきます。\n招待リンクは、後ほど運営からメールで届きます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/Team work_Outline2.png',
        title: '⚠️ トーク時の注意',
        body:
            'トークは1日限りのため、積極的な交流をお願いします。\nまた、お相手とのトーク時は、否定ではなく「共感」をするように心がけましょう。',
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
