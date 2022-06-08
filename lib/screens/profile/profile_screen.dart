import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/screens/my_profile_screen.dart';
import 'package:astrotak/widgets/custom_toggleButton.dart';
import 'package:astrotak/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = '/ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kOrangeColor,
            ),
          ),
          title: const Image(
            image: AssetImage('assets/images/icon.png'),
            width: 60,
            height: 60,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(color: kOrangeColor),
                    primary: Colors.white,
                    minimumSize: const Size(20, 25)),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 10,
                    color: kOrangeColor,
                  ),
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: kOrangeColor,
            labelColor: kOrangeColor,
            unselectedLabelColor: Colors.black,
            labelPadding: EdgeInsets.all(10),
            tabs: [
              Text(
                'My Profile',
                style: kNormaltext,
              ),
              Text(
                'Order History',
                style: kNormaltext,
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          MyProfileScreen(),
          MyPlaceHolder(),
        ]),
      ),
    );
  }
}
