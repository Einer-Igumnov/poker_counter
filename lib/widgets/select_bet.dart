import 'package:flutter/material.dart';
import 'package:simple_poker_counter/global_data.dart';
import '../main.dart';

Widget BetPopup(BuildContext context) {
  int bet = 0;
  return AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Stack(children: [
      Positioned(
          bottom: 30,
          left: 10,
          right: 10,
          child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: ListTile(
                title: TextField(
                  onChanged: (text) {
                    try {
                      bet = int.parse(text);
                    } on FormatException {}
                  },
                  decoration: InputDecoration(hintText: "Select your bet"),
                ),
                leading: Icon(
                  Icons.attach_money_rounded,
                  color: Colors.black,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    selected_bet = bet;
                    Navigator.pop(context);
                  },
                ),
              ))))
    ]),
  );
}
