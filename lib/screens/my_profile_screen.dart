import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/screens/friend_family_list_page.dart';
import 'package:astrotak/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              physics: const BouncingScrollPhysics(),
              indicatorPadding: const EdgeInsets.all(5),
              indicator: BoxDecoration(
                // border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(7),
                color: kOrangeColor,
              ),
              // indicatorColor: kOrangeColor,
              indicatorWeight: 0.1,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelPadding: const EdgeInsets.all(15),

              tabs: const [
                Text('Basic Profile'),
                Text('Friends and Family Profile'),
              ],
            ),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: TabBarView(
                  children: [MyPlaceHolder(), FriendAndFamilyProfilePage()]),
            ))
          ],
        ));
  }
}
