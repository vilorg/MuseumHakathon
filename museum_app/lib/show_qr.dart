import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQr extends StatefulWidget {
  const ShowQr({Key? key}) : super(key: key);

  @override
  State<ShowQr> createState() => _ShowQrState();
}

class _ShowQrState extends State<ShowQr> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String ticketId = "";
  bool haveTicket = false;

  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      String? valueTicket = prefs.getString("ticketValue");

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
      body: Container(
        child: QrImage(data: 'ticketId', size: 150, version: QrVersions.auto),
      ),
    );
  }
}
