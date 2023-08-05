import 'package:flutter/material.dart';
import '../main.dart';
import '../global_data.dart';
import 'inform_winner.dart';

class EndRoundButton extends StatefulWidget {
  const EndRoundButton({Key? key}) : super(key: key);
  @override
  State<EndRoundButton> createState() => _EndRoundButtonState();
}

class _EndRoundButtonState extends State<EndRoundButton> {
  @override
  Widget build(BuildContext context) {
    return is_game_active
        ? FloatingActionButton(
            child: Icon(Icons.monetization_on_outlined),
            onPressed: () {
              for (int i = 0; i < players.length; i++) {
                bet_sum += players[i].currentBet;
                players[i].end_round();
              }
              setState(() {
                is_game_active = false;
              });
              showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.of(context).pop(true);
                    });
                    return WinnerPopup(context);
                  });
            },
          )
        : FloatingActionButton.extended(
            onPressed: () {
              if (winner == -1) {
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop(true);
                      });
                      return WinnerPopup(context);
                    });
              } else {
                players[winner].balance += bet_sum;
                bet_sum = 0;
                setState(() {
                  is_game_active = true;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
                winner = -1;
              }
            },
            backgroundColor: Colors.green,
            label: Text("End round"),
            icon: Icon(Icons.monetization_on_outlined),
          );
  }
}
