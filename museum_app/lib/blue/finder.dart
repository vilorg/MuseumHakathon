import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:museum_app/blue/exp_play.dart';
import 'package:museum_app/blue/user_play.dart';

class Finder extends StatefulWidget {
  const Finder({Key? key}) : super(key: key);

  @override
  State<Finder> createState() => _FinderState();
}

class _FinderState extends State<Finder> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ExpPLay()));
    });
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
            child: const Center(
                child: Text("Ожидание",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)))));
  }
}
