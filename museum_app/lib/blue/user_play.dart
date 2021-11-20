import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPLay extends StatefulWidget {
  const UserPLay({Key? key}) : super(key: key);

  @override
  State<UserPLay> createState() => _UserPLayState();
}

class _UserPLayState extends State<UserPLay> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Image(
            image: AssetImage("assets/images/first_mamont.png"),
            fit: BoxFit.fill),
      ),
    );
  }
}
