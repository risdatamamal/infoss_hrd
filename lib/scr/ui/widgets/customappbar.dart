import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height / 8.5,
        width: width,
        padding: EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blue[200], Colors.blueAccent]),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  print("pop");
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
