import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/blue/searcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQr extends StatefulWidget {
  const ShowQr({Key? key}) : super(key: key);

  @override
  State<ShowQr> createState() => _ShowQrState();
}

class _ShowQrState extends State<ShowQr> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int ticketId = 0;
  bool haveTicket = false;

  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      int? valueTicket = prefs.getInt("ticketValue");

      if (valueTicket != null) {
        setState(() {
          ticketId = valueTicket;
          haveTicket = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          QrImage(data: 'ticketId', size: 300, version: QrVersions.auto),
          Container(
              padding: const EdgeInsets.all(30),
              child: const Text("Проверить валидность:",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic))),
          SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Searcher()));
                  },
                  child: const Text("Check", style: TextStyle(fontSize: 25))))
        ])));
  }
}
