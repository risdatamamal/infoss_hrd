import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infoss_hrd/scr/commons.dart';
import 'package:infoss_hrd/scr/models/leave_for_listing.dart';
import 'package:infoss_hrd/scr/ui/screen/leave_addpage.dart';

class LeavePage extends StatelessWidget {
  final leaves = [
    new LeaveListing(
      dateLeave: DateTime.now(),
      reason: "Sakit",
      note: "Demam",
      status: "Setuju",
      createDateTime: DateTime.now(),
    ),
    new LeaveListing(
      dateLeave: DateTime.now(),
      reason: "Cuti",
      note: "Acara Keluarga",
      status: "Menunggu",
      createDateTime: DateTime.now(),
    ),
    new LeaveListing(
      dateLeave: DateTime.now(),
      reason: "Cuti",
      note: "Acara Festival",
      status: "Tidak Disetujui",
      createDateTime: DateTime.now(),
    ),
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          child: Image(
                              image: AssetImage(
                                  "assets/icon/previous-button.png")),
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
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                      color: Color(0xff8DD5E1),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListView.separated(
                      separatorBuilder: (_, __) =>
                          Divider(height: 1, color: Color(0xff8DD5E1)),
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Durasi    ' +
                                        ': ' +
                                        formatDateTime(
                                            leaves[index].dateLeave) +
                                        ' - ' +
                                        formatDateTime(leaves[index].dateLeave),
                                  ),
                                  Text(
                                    'Alasan   ' + ': ' + leaves[index].reason,
                                  ),
                                  Text('Note       ' +
                                      ': ' +
                                      leaves[index].note),
                                  Text('Status    ' +
                                      ': ' +
                                      leaves[index].status),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                          '${formatDateTime(leaves[index].createDateTime)}'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: leaves.length),
                ),
              ],
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LeaveAddPage()));
                    })),
          ),
        ],
      ),
    );
  }
}
