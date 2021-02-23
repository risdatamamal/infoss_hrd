import 'package:flutter/material.dart';
import 'package:infoss_hrd/scr/commons.dart';

class LeavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 5.0),
              child: Image.asset(
                "assets/gambar/Logo.png",
                scale: 3.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff28B0C7),
                border: Border.all(
                  color: Color(0xff28B0C7),
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("INFOSS HRD",
                    style: TextStyle(fontSize: 20, color: white)),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: white,
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/background/logo-background.png'),
              color: white,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      child: Image(
                          image: AssetImage("assets/icon/previous-button.png")),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    "Leave",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                    color: Color(0xff28B0C7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xff28B0C7))),
                    child: Text(
                      "Request Leave",
                      style: TextStyle(color: white),
                    ),
                    onPressed: () {})),
          ),
        ],
      ),
    );
  }
}
