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
        title: 'アナタノミカタへようこそ！',
        body:
            'このアプリでは、あなたと同じ悩みを抱える方と繋がることができます。\nここでは簡単に、アプリの流れや機能について説明していきます！',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 69, 142, 88),
        imageAssetPath: 'images/registerpage.png',
        title: '1. あなたのお悩みを登録',
        body: 'ユーザー登録時に、あなたの悩みに該当する項目を選択していただくことで、悩みを登録していきます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/homepage_sample01.png',
        title: '2. あなたと同じ悩みを抱えるお相手が表示されます',
        body:
            '4つの悩み要因ごとに、同じ悩みを抱えるお相手が表示されます。\nマッチング相手をタップすると、登録されている悩みの説明を見ることができます！',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/homepage_sample02.png',
        title: '2. あなたと同じ悩みを抱えるお相手が表示されます',
        body: 'また、左上のメニューから、登録した悩みの確認や、悩みの説明の編集等をすることができます！',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 69, 142, 88),
        imageAssetPath: 'images/line_openchat.png',
        title: '3. LINEのオープンチャットで1日限りのトーク',
        body:
            'マッチングしたお相手と1対1で、1日限りのトークをしていただきます。\nトークルームの招待リンクは、後ほど運営からメールで届きます。',
        doAnimateImage: true),
    PageModel(
        color: const Color.fromARGB(255, 81, 161, 101),
        imageAssetPath: 'images/OK.png',
        title: '⚠️ トーク時の注意',
        body:
            'トークは1日限りのため、積極的な交流をお願い致します。\nまた、お相手とのトーク時は、否定ではなく「共感」をするように心がけましょう！',
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
