import 'package:flutter/material.dart';
import 'package:simple_poker_counter/widgets/select_bet.dart';
import '../global_data.dart';
import '../main.dart';

class PlayerCard extends StatefulWidget {
  String name = "";
  int balance = 0;
  Color avatarColor = Colors.blue;

  int id = 0;

  int currentBet = 0;

  bool isActive = true;

  void end_round() {
    balance -= currentBet;
    currentBet = 0;
    isActive = true;
  }

  PlayerCard(String _name, int _balance, Color _color, int _id) {
    name = _name;
    balance = _balance;
    avatarColor = _color;
    id = _id;
  }

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  void raise(int bet) {
    setState(() {
      widget.currentBet = bet;
    });
  }

  void fold() {
    setState(() {
      widget.isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (is_game_active == false) {
            setState(() {
              winner = widget.id;
            });
          }
        },
        child: Container(
          height: 125,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
              border: Border.all(
                  color: widget.id == winner ? Colors.green : Colors.white),
              color: widget.isActive ? Colors.white : Colors.grey[200],
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: widget.avatarColor,
                child: Text(
                  this.widget.name[0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                widget.name,
                style: TextStyle(
                    color: widget.isActive ? Colors.black : Colors.grey),
              ),
              trailing: Text(
                "balance: ${widget.balance - widget.currentBet}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.isActive ? Colors.black : Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                TextButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) => BetPopup(context),
                      );
                      raise(selected_bet);
                      setState(() {});
                    },
                    child: Text("Raise")),
                TextButton(
                    onPressed: () {
                      fold();
                    },
                    child: Text("Fold"))
              ],
            )
          ]),
        ));
  }
}
