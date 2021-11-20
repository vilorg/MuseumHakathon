import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  late Future<bool> haveQr;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    haveQr = _prefs.then((prefs) {
      String? valueQr = prefs.getString("qrValue");
      if (valueQr != null) {
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var noQr = Container(
        margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
        child: const Center(
            child: Text(
                "Привяжите qr код в настройках для того, чтобы купить билет",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic))));

    var yesQr = ListView(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Center(
                child: Text("Доступные билеты",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)))),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[400]),
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Купить билет в музей эстрады",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Цена: 1800₽",
                            style: TextStyle(
                                color: Colors.primaries[0],
                                fontSize: 17,
                                fontStyle: FontStyle.italic)),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Купить"))
                      ])
                ])),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[400]),
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Купить билет на выставку кукол",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Цена: 1500₽",
                            style: TextStyle(
                                color: Colors.primaries[0],
                                fontSize: 17,
                                fontStyle: FontStyle.italic)),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Купить"))
                      ])
                ]))
      ],
    );

    return Scaffold(
        body: FutureBuilder(
            future: haveQr,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.data) return yesQr;
                  return noQr;
              }
            }));
  }
}
