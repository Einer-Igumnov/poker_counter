import 'package:flutter/material.dart';
import 'widgets/player_card.dart';
import 'widgets/add_player_popup.dart';
import 'widgets/end_round_button.dart';
import 'global_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple poker counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Poker counter",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AddPlayerPopup(context),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: players.length != 0
          ? ListView.builder(
              itemCount: players.length,
              prototypeItem: players.first,
              itemBuilder: (context, index) {
                return players[index];
              },
            )
          : Container(),
      floatingActionButton: EndRoundButton(),
    );
  }
}
