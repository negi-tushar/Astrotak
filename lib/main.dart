import 'package:astrotak/provider/category_provider.dart';
import 'package:astrotak/provider/relatives_provider.dart';
import 'package:astrotak/screens/homepage.dart';
import 'package:astrotak/screens/profile/add_profile_screen.dart';
import 'package:astrotak/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Categoryprovider()),
        ChangeNotifierProvider(create: (context) => RelativesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Astrotak',
        theme: ThemeData(
          fontFamily: 'Open Sans',
          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
        routes: {
          ProfileScreen.id: (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
