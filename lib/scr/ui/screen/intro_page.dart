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
        image: Image.asset(
          "assets/gambar/Illustration-1.png",
          scale: 1.2,
          alignment: Alignment.topLeft,
        ),
        title: "Let us take care of you",
        description:
            "We are here to take care of you with pleasure. besides that we will monitor your condition 24/Day"),
    IntroModel(
        image: Image.asset(
          "assets/gambar/Illustration-2.png",
          scale: 1.2,
          alignment: Alignment.topLeft,
        ),
        title: "Always use a mask",
        description:
            "always use a mask when you want to travel and keep your body immunity"),
    IntroModel(
        image: Image.asset(
          "assets/gambar/Illustration-3.png",
          scale: 1.2,
          alignment: Alignment.topLeft,
        ),
        title: "Work from home",
        description:
            "to avoid the spread of covid 19. you can do office work from home and always be close to your family"),
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
          child: Stack(
            children: <Widget>[
              Container(
                color: white,
              ),
              SafeArea(
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Color(0xffECF8FF),
                  child: page.image,
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 500,
                    height: 200,
                    child: Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              page.title,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: blue,
                                decoration: TextDecoration.none,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
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
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: page.extraWidget),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    widgets.add(
      new Container(
        color: Color(0xffECF8FF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                size: 125.0,
                color: blue,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
                child: Text(
                  "Start your work today.",
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
