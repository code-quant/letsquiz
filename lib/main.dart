import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsquiz/ui/colors.dart';
import 'package:letsquiz/ui/colors.dart' as prefix0;
import 'ui/pages/about.dart';
import 'ui/pages/home.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lets Quiz',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
      },

      //Default Theme Style for whole app
      theme: ThemeData(
          accentColor: Colors.pink,
          fontFamily: "GoogleSans",
          textTheme: TextTheme(
            body1: TextStyle(color: darkText),
          ),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            buttonColor: primaryColor,
          ),
          chipTheme: ChipTheme.of(context).copyWith(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          )),
    );
  }
}
