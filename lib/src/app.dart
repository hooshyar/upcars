import 'package:flutter/material.dart';
import 'package:upcars/src/cars_screen/cars_screen_view.dart';
import 'package:upcars/src/home_screen/home_screen_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreenView(),
        '/cars': (context) => CarListScreenView(),
      },
    );
  }
}
