import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),

      // home: HomePage(),
    );
  }
}
