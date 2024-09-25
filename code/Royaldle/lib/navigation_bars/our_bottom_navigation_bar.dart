import 'package:flutter/material.dart';
import 'package:royaldle/style/others.dart';

import '../screens/classique.dart';
import '../screens/description.dart';

class OurBottomNavigationBar extends StatefulWidget {
  const OurBottomNavigationBar({super.key});

  @override
  State<OurBottomNavigationBar> createState() => _OurBottomNavigationBarState();
}

class _OurBottomNavigationBarState extends State<OurBottomNavigationBar> {
  static int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  setPage(int index){
    List pages = [
      //Welcome.routeName,
      Classique.routeName,
      Description.routeName,
      // Emoji.routeName
    ];
    Navigator.pushNamed(context, pages[index]);
  }

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => {setCurrentIndex(index), setPage(_currentIndex)},
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.black,
      iconSize: kIconSize,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.castle), label: 'Classique'),
        BottomNavigationBarItem(icon: Icon(Icons.comment_outlined), label: 'Description'),
        // BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Emoji')
      ],
    );
  }
}