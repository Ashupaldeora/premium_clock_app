import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premium_clock_app/view/screen/home.dart';
import 'package:premium_clock_app/view/screen/stopwatch.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff120F14),
  ));
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock',
      initialRoute: '/home',
      routes: {
        '/home': (context) => homescreen(),
        '/stopwatch': (context) => stopwatch(),
      },
    );
    ;
  }
}
