import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpPLay extends StatefulWidget {
  const ExpPLay({Key? key}) : super(key: key);

  @override
  State<ExpPLay> createState() => _ExpPLayState();
}

class _ExpPLayState extends State<ExpPLay> {
  static AudioCache player = AudioCache();
  String alarmAudioPath = "sounds/audio.mp3";

  @override
  Widget build(BuildContext context) {
    player.play(alarmAudioPath);

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Image(
            image: AssetImage("assets/images/second_mamont.png"),
            fit: BoxFit.fill),
      ),
    );
  }
}
