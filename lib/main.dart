import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'xoborad.dart';
import 'splashscreen.dart';

void main() {
  return runApp(game());
}

class game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Gameborad.routename :(context) => Gameborad(),
        Splashscreen.routename:(context)=>Splashscreen(),
      },
      initialRoute: Splashscreen.routename,
    );
  }
}
