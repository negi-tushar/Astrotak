import 'package:astrotak/screens/ask_question_screen.dart';
import 'package:astrotak/screens/homepage.dart';
import 'package:astrotak/screens/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astrotak',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
      routes: {
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
