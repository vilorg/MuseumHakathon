import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/profile.dart';
import 'package:museum_app/ticket.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  void _onMenuItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List classes = [const Profile(), const Ticket()];

  @override
  Widget build(BuildContext context) {
    var menu = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people), label: "Профиль"),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), label: "Билеты")
      ],
      selectedItemColor: Colors.primaries[0],
      unselectedItemColor: Colors.primaries[0].withOpacity(0.2),
      currentIndex: _selectedIndex,
      onTap: _onMenuItemTapped,
      showUnselectedLabels: true,
      iconSize: 20,
      selectedFontSize: 17,
      unselectedFontSize: 17,
    );

    return SafeArea(
        child: Scaffold(
      body: classes[_selectedIndex],
      bottomNavigationBar: menu,
    ));
  }
}