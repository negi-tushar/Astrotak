import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/screens/ask_question_screen.dart';
import 'package:astrotak/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _index = 2;

  List<Widget> pages = [
    const MyPlaceHolder(),
    const MyPlaceHolder(),
    const AskQuestionScreen(),
    const MyPlaceHolder(),
    const MyPlaceHolder(),
  ];

  void updatePage(int page) {
    setState(() {
      _index = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          currentIndex: _index,
          selectedItemColor: kOrangeColor,
          unselectedItemColor: Colors.black,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Image(
                color: _index == 0 ? kOrangeColor : Colors.black,
                image: const AssetImage('assets/images/home.png'),
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Talk',
              icon: Image(
                color: _index == 1 ? kOrangeColor : Colors.black,
                image: const AssetImage('assets/images/talk.png'),
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Ask Question',
              icon: Image(
                color: _index == 2 ? kOrangeColor : Colors.black,
                image: const AssetImage('assets/images/ask.png'),
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Reports',
              icon: Image(
                color: _index == 3 ? kOrangeColor : Colors.black,
                image: const AssetImage('assets/images/reports.png'),
                height: 20,
                width: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon: Image(
                color: _index == 4 ? kOrangeColor : Colors.black,
                image: const AssetImage('assets/images/chat.png'),
                height: 20,
                width: 20,
              ),
            ),
          ]),
    );
  }
}
