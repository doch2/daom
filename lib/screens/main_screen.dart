import 'package:daom/screens/chat/chat_main.dart';
import 'package:daom/screens/community/community_main.dart';
import 'package:daom/screens/my_profile.dart';
import 'package:daom/screens/trend.dart';
import 'package:flutter/material.dart';

import 'package:daom/screens/home.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    List pages = [
      Home(),
      Trend(),
      CommunityMain(),
      ChatMain(),
      MyProfile()
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        selectedFontSize: 12,
        currentIndex: _selectIndex,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "홈",
            icon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
              label: "트렌드",
              icon: Icon(Icons.fiber_new)
          ),
          BottomNavigationBarItem(
              label: "커뮤니티",
              icon: Icon(Icons.article_outlined)
          ),
          BottomNavigationBarItem(
              label: "채팅",
              icon: Icon(Icons.message)
          ),
          BottomNavigationBarItem(
              label: "내 정보",
              icon: Icon(Icons.person)
          ),
        ],
      ),
      body: pages[_selectIndex]
    );
  }
}