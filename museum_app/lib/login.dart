import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'main_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late PhoneNumber _phoneNumber = PhoneNumber(
      countryISOCode: "RU", countryCode: "RU", number: "9222222222");
  bool _visible = false;
  late String code;
  String baseUrl = "http://192.168.1.7:5000/";

  @override
  Widget build(BuildContext context) {
    Column sms = Column(children: [
      const SizedBox(height: 30),
      Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, color: Colors.white),
            onSubmitted: (String e) {
              if (e.length == 4) {
                setState(() => code = e);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    backgroundColor: Colors.black45,
                    elevation: 0,
                    content: Text(
                      "Введите корректный номер код!",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                      textAlign: TextAlign.center,
                    )));
              }
            },
            keyboardType: const TextInputType.numberWithOptions(),
          )),
      const SizedBox(height: 10),
      Text(
          "Мы отправили SMS с кодом на Ваш телефон ${_phoneNumber.completeNumber}.",
          style:
              const TextStyle(color: Colors.white54, fontSize: 17, height: 1.2))
    ]);

    Container phone = Container(
        padding: const EdgeInsets.only(left: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: IntlPhoneField(
              onSubmitted: (String e) {
                if (e.length == 10) {
                  setState(() {
                    var url = Uri.parse(baseUrl +
                        "create-user?num=" +
                        _phoneNumber.countryCode! +
                        e);
                    _visible = true;
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      backgroundColor: Colors.black45,
                      elevation: 0,
                      content: Text(
                        "Введите корректный номер телефона!",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                        textAlign: TextAlign.center,
                      )));
                }
              },
              enabled: !_visible,
              countryCodeTextColor: Colors.white,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(
                  hoverColor: Colors.white,
                  labelText: 'Номер телефона',
                  labelStyle: TextStyle(color: Colors.white54),
                  counterStyle: TextStyle(color: Colors.white54),
                  contentPadding: EdgeInsets.all(0),
                  border: UnderlineInputBorder()),
              initialCountryCode: 'RU',
              showCountryFlag: true,
              showDropdownIcon: false,
              countries: const ["RU", "UA", "KZ", "BY"],
              onChanged: (phone) {
                _phoneNumber = phone;
              },
            ),
          ),
          IconButton(
              onPressed: () => setState(() => _visible = false),
              icon: const Icon(Icons.refresh))
        ]));

    return Scaffold(
        body: Container(
            color: Colors.black45,
            padding: const EdgeInsets.all(15),
            child: Column(children: <Widget>[
              const SizedBox(height: 30),
              phone,
              const SizedBox(height: 10),
              const Text(
                "SMS с кодом подтверждениея придёт на Ваш номер телефона.",
                style:
                    TextStyle(color: Colors.white54, fontSize: 17, height: 1.2),
              ),
              Visibility(visible: _visible, child: sms)
            ])));
  }
}
