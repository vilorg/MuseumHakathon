import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:museum_app/blue/user_play.dart';

class Searcher extends StatefulWidget {
  const Searcher({Key? key}) : super(key: key);

  @override
  State<Searcher> createState() => _SearcherState();
}

class _SearcherState extends State<Searcher> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ExpPLay()));
    });
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: const Center(
                child: Text("Проследуйте к экспонату",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)))));
  }
}
