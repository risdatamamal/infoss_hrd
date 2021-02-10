import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:infoss_hrd/scr/commons.dart';
import 'package:infoss_hrd/scr/constant/constants.dart';
import 'package:infoss_hrd/scr/models/intro_model.dart';
import 'package:infoss_hrd/scr/ui/custom/custom_flat_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  final SharedPreferences prefs;

  final List<IntroModel> pages = [
    IntroModel(
        icon: Icons.star,
        title: "Selamat Datang Karyawan Terhormat",
        description: "Informasi untuk Para Karyawan"),
    IntroModel(
        icon: Icons.ac_unit,
        title: "Dengan Desain Memukau",
        description: "blablablabla"),
    IntroModel(
        icon: Icons.info_outline,
        title: "Informative",
        description: "Aplikasi Mobile yang Sangat Informatif"),
  ];

  IntroScreen({this.prefs});
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper.children(
        autoplay: false,
        index: 0,
        loop: false,
        pagination: new SwiperPagination(
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
          builder: new DotSwiperPaginationBuilder(
              color: blue, size: 6.5, activeSize: 8.0),
        ),
        control: SwiperControl(
          iconPrevious: null,
          iconNext: null,
        ),
        children: _getPages(context),
      ),
    );
  }

  List<Widget> _getPages(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.pages.length; i++) {
      IntroModel page = widget.pages[i];
      widgets.add(
        new Container(
          color: white,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Icon(
                  page.icon,
                  size: 125.0,
                  color: blue,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
                child: Text(
                  page.title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blue,
                    decoration: TextDecoration.none,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    page.description,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blue,
                      decoration: TextDecoration.none,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300,
                      fontFamily: "OpenSans",
                    ),
                  ))
            ],
          ),
        ),
      );
    }
    widgets.add(
      new Container(
        color: white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.code,
                size: 125.0,
                color: blue,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
                child: Text(
                  "Jump straight into the action.",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: blue,
                    decoration: TextDecoration.none,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
                child: CustomFlatButton(
                  title: "Get Started",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  textColor: white,
                  onPressed: () {
                    Navigator.of(context).pushNamed(SIGN_IN);
                  },
                  splashColor: black,
                  borderColor: white,
                  borderWidth: 2,
                  color: blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return widgets;
  }
}
