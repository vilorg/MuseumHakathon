import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/profile.dart';
import 'package:museum_app/ticket.dart';

import 'login.dart';

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

  List classes = [const Ticket(), const Profile()];

  @override
  Widget build(BuildContext context) {
    var menu = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), label: "Купить билеты"),
        BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people), label: "Профиль"),
      ],
      selectedItemColor: Colors.primaries[0],
      unselectedItemColor: Colors.primaries[0].withOpacity(0.2),
      currentIndex: _selectedIndex,
      onTap: _onMenuItemTapped,
      showUnselectedLabels: true,
      iconSize: 30,
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

class Cleaners extends StatelessWidget {
  const Cleaners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Icon(Icons.favorite, size: 50, color: Colors.grey.shade600),
      const SizedBox(height: 20),
      Text(
        "Здесь будут клинеры, которые вам понравятся",
        style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
      )
    ]));
  }
}

class Bonuses extends StatelessWidget {
  const Bonuses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
            width: MediaQuery.of(context).size.width * 0.8,
            image: const AssetImage("assets/images/bonuses.png")));
  }
}
