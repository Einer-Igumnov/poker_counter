import 'package:flutter/material.dart';

Widget WinnerPopup(BuildContext context) {
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
                title: Text("Select round winner"),
                leading: Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.green,
                ),
              ))))
    ]),
  );
}
