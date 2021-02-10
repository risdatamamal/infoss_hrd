import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infoss_hrd/scr/commons.dart';
import 'package:infoss_hrd/scr/constant/constants.dart';
import 'package:infoss_hrd/scr/ui/screen/intro_page.dart';
import 'package:infoss_hrd/scr/ui/screen/sign_in.dart';
import 'package:infoss_hrd/scr/ui/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    runApp(MyApp(prefs: prefs));
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  MyApp({this.prefs});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Solusi Sentral Data",
      theme: ThemeData(primaryColor: white),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SIGN_IN: (BuildContext context) => SignInPage(),
        //  FORGOT_PASSWORD: (BuildContext context) => ForgotPassword(),
        INTRO: (BuildContext context) => IntroScreen(),
      },
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      return new SignInPage();
    } else {
      return new SplashScreen(prefs: prefs);
    }
  }
}
