import 'package:classic_cars_collection/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classic Car Collection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PoiretOne",
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
