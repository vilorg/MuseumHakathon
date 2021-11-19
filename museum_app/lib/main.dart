import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  // const Main({Key? key, required this.title}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isRegister=true;

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      bool key = (prefs.getBool("isRegister") ?? true);
      if (key) {
        prefs.setBool("isRegister", false);
      }
      setState(() {
        _isRegister = key;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<bool>(
    //   future: _isRegister,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.none:
    //       case ConnectionState.waiting:
    //         return const CircularProgressIndicator();
    //       default:
    //         if (snapshot.hasError) {
    //           return Center(child: Text('Error: ${snapshot.error}'));
    //         } else {
    if (_isRegister) {
      return const Login();
    }
    return const MainPage();
    //         }
    //     }
    //   }
    // );
  }
}
