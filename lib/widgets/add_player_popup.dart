import 'package:flutter/material.dart';
import '../main.dart';
import 'player_card.dart';
import 'dart:math';
import '../global_data.dart';

import '../constants.dart';

var rng = Random();

Widget AddPlayerPopup(BuildContext context) {
  String name = "";
  int balance = 0;
  return AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Stack(children: [
      Align(
          alignment: Alignment(0, 0),
          child: Container(
              height: 260,
              width: MediaQuery.of(context).size.width > 270
                  ? 270
                  : MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(children: [
                SizedBox(height: 20),
                Text(
                  "Add a player",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      decoration: InputDecoration(hintText: "Player name..."),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      onChanged: (text) {
                        try {
                          balance = int.parse(text);
                        } on FormatException {}
                      },
                      decoration:
                          InputDecoration(hintText: "Player balance..."),
                    )),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      players.add(PlayerCard(
                          name,
                          balance,
                          RANDOM_COLORS[rng.nextInt(RANDOM_COLORS.length)],
                          players.length));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    label: Text("Finish"))
              ])))
    ]),
  );
}
