import 'package:empathy_flutter/pages/user_page.dart';
import 'package:empathy_flutter/pages/worries1_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  static const _screens = [
    Worries1Page(),
    Worries1Page(),
    Worries1Page(),
    Worries1Page(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('マッチング一覧'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPage()));
              },
            ),
          ],
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.school), label: '学業'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '人間関係'),
            BottomNavigationBarItem(icon: Icon(Icons.cottage), label: '環境の変化'),
            BottomNavigationBarItem(icon: Icon(Icons.face), label: '自分のこと'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}
