import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'core/constants.dart';
import 'core/theme_app.dart';
import 'pages/calculator_page.dart';

void main() {
  runApp(new MaterialApp(
    title: kAppTitle,
    theme: kAppTheme,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 15,
        navigateAfterSeconds: new CalculatorPage(),
        title: new Text(
          kAppTitle,
          style: new TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 34.0),
        ),
        image: new Image.asset('assets/images/floor.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 80.0,
        loaderColor: Colors.deepPurple);
  }
}
