import 'package:flutter/material.dart';

class MyPlaceHolder extends StatelessWidget {
  const MyPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/icon.png'),
        ),
      ),
    );
  }
}
