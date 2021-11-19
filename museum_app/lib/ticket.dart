import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.grey[400]),
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Купить билет",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Цена: 1000₽", style: TextStyle(
                          color: Colors.primaries[0],
                          fontSize: 17, fontStyle: FontStyle.italic)),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Купить"))
                    ])
              ])),
    );
  }
}
