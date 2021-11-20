import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/scan_qr.dart';
import 'package:museum_app/scan_qr_checker.dart';
import 'package:museum_app/show_qr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String qr = "";
  bool haveQr = false;

  int ticketId = 0;
  bool haveTicket = false;

  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      String? valueQr = prefs.getString("qrValue");
      int? valueTicket = prefs.getInt("ticketValue");

      if (valueTicket != null) {
        setState(() {
          ticketId = valueTicket;
          haveTicket = true;
        });
      }

      if (valueQr != null) {
        setState(() {
          qr = valueQr;
          haveQr = true;
        });
      }
    });
  }

  late String result;

  var general = Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
    child: const Text("Настройки профиля пользователя:",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
  );

  var qrGeneral = Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
    child: const Text("Настройки qr кода привитого:",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
  );

  var ticketGeneral = Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
    child: const Text("Купленные билеты:",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
  );

  var checkerGeneral = Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
    child: const Text("Занять роль проверяющего:",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
  );

  var personalDataDmitry = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/avatar.png"),
        ),
        SizedBox(width: 30),
        Text(
          "Dmitry Petrov",
          style: TextStyle(fontSize: 23),
        )
      ],
    ),
  );

  var personalDataTimofey = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/avatar_tima.png"),
        ),
        SizedBox(width: 60),
        SizedBox(
            width: 100,
            child: Text(
              "Timofey Reznikov",
              style: TextStyle(fontSize: 23),
            ))
      ],
    ),
  );

  var personalEmptyData = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        CircleAvatar(
          radius: 50,
        ),
        SizedBox(width: 30),
        Text(
          "Пользователь",
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    var personalData = personalEmptyData;
    if (qr == "8453719724") {
      setState(() {
        personalData = personalDataDmitry;
      });
    } else if (qr == "3718497765") {
      setState(() {
        personalData = personalDataTimofey;
      });
    }

    List<Widget> haveQrData = [
      SizedBox(
        width: 130,
        child: Column(
          children: [
            const Text("Ваша лицензия:",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(qr,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 17, fontStyle: FontStyle.italic))
          ],
        ),
      ),
      const SizedBox(width: 20),
      SizedBox(
          width: 150,
          child: Column(children: [
            const Text("Обновить вашу лицензию:",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            ElevatedButton(
                child: const Text("Тык"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyQRView()));
                })
          ]))
    ];

    List<Widget> notQrData = [
      const SizedBox(
          width: 130,
          child: Text("Ваша лицензия отсутствует...",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
      const SizedBox(width: 20),
      SizedBox(
          width: 150,
          child: Column(children: [
            const Text("Обновить вашу лицензию:",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            ElevatedButton(
                child: const Text("Тык"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyQRView()));
                })
          ]))
    ];

    var qrData = Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: (haveQr ? haveQrData : notQrData)));

    List<Widget> haveTicketData = [
      const Text("Статус: получен",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      Text("Id: $ticketId", style: const TextStyle(fontSize: 20))
    ];

    List<Widget> notTicketData = [
      const Text("Билет не куплен",
          style: TextStyle(fontSize: 19, fontStyle: FontStyle.italic))
    ];

    var ticketData = Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: (haveTicket ? haveTicketData : notTicketData)),
            const SizedBox(height: 30),
            (haveTicket
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShowQr()));
                    },
                    child: const Text("Получить qr билета"))
                : ElevatedButton(
                    onPressed: () {},
                    child: const Text("Получить qr билета"),
                    style: ElevatedButton.styleFrom(primary: Colors.grey[300])))
          ],
        ));

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            general,
            const SizedBox(height: 20),
            personalData,
            const SizedBox(height: 20),
            qrGeneral,
            const SizedBox(height: 10),
            qrData,
            ticketGeneral,
            ticketData,
            checkerGeneral,
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckerQRView()));
                },
                child: const Text("Тык"))
          ])),
    );
  }
}
