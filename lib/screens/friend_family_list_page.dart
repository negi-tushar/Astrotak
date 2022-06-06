import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/screens/profile/add_profile_screen.dart';
import 'package:astrotak/widgets/custom_drop_down.dart';
import 'package:astrotak/widgets/custom_text_formfield.dart';
import 'package:astrotak/widgets/custom_toggleButton.dart';
import 'package:astrotak/widgets/wallet_balance.dart';
import 'package:flutter/material.dart';

class FriendAndFamilyProfilePage extends StatefulWidget {
  const FriendAndFamilyProfilePage({Key? key}) : super(key: key);

  @override
  State<FriendAndFamilyProfilePage> createState() =>
      _FriendAndFamilyProfilePageState();
}

class _FriendAndFamilyProfilePageState
    extends State<FriendAndFamilyProfilePage> {
  bool _isAddProfile = false;
  //String timeZone = 'AM';
  @override
  Widget build(BuildContext context) {
    return !_isAddProfile
        ? Column(
            children: [
              const Walletbalance(),
              const SizedBox(
                height: 15,
              ),
              DataTable(columns: const [
                DataColumn(
                  label: Text('Name'),
                )
              ], rows: []),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isAddProfile = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // side: const BorderSide(color: kOrangeColor),
                    primary: kOrangeColor,
                    minimumSize: const Size(150, 40)),
                child: const Text(
                  '+ Add New Profile',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        : AddProfileScreen(
            onpressed: () {
              setState(() {
                _isAddProfile = !_isAddProfile;
              });
            },
          );
  }
}
