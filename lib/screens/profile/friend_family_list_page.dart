import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/data/model/relatives.dart';
import 'package:astrotak/data/services/delete_relative.dart';
import 'package:astrotak/data/services/get_relatives.dart';
import 'package:astrotak/provider/relatives_provider.dart';
import 'package:astrotak/screens/profile/add_profile_screen.dart';
import 'package:astrotak/widgets/wallet_balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendAndFamilyProfilePage extends StatefulWidget {
  const FriendAndFamilyProfilePage({Key? key}) : super(key: key);

  @override
  State<FriendAndFamilyProfilePage> createState() =>
      _FriendAndFamilyProfilePageState();
}

class _FriendAndFamilyProfilePageState
    extends State<FriendAndFamilyProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  AllRelative? allRelative;
  bool _isAddProfile = false;
  //String timeZone = 'AM';
  @override
  Widget build(BuildContext context) {
    final relativeData =
        Provider.of<RelativesProvider>(context).allRelativesData;
    FetchRelativesData().getRelativesData(context);

    return !_isAddProfile
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Walletbalance(),
                const SizedBox(
                  height: 15,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: const [
                //     Text('Name     '),
                //     Text('DOB         '),
                //     Text('TOB        '),
                //     Text('Relation        '),
                //     Text('    '),
                //     Text('    '),
                //   ],
                // ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Table(
                      // border: TableBorder.all(),
                      children: const [
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            'Name',
                            style: kTableColumntext,
                          )),
                          TableCell(
                              child: Text(
                            'DOB',
                            style: kTableColumntext,
                          )),
                          TableCell(
                              child: Text(
                            'TOB',
                            style: kTableColumntext,
                          )),
                          TableCell(
                              child: Text(
                            'Relation',
                            style: kTableColumntext,
                          )),
                          TableCell(child: Text('')),
                          TableCell(
                            child: Text(' '),
                          ),
                        ])
                      ]),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: relativeData.allRelatives.length,
                    itemBuilder: (context, index) {
                      var data = relativeData.allRelatives[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Table(
                          // border: TableBorder.all(),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      data.fullName,
                                      style: kNormaltext,
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      ('${data.birthDetails.dobDay}-${data.birthDetails.dobMonth}-${data.birthDetails.dobYear}'),
                                      style: kNormaltext,
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      ('${data.birthDetails.tobHour}:${data.birthDetails.tobMin}'),
                                      style: kNormaltext,
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      data.relation,
                                      style: kNormaltext,
                                    )),
                                TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: IconButton(
                                        iconSize: 20,
                                        color: kOrangeColor,
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          setState(() {
                                            allRelative = data;
                                            _isAddProfile = !_isAddProfile;
                                          });
                                        })),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: IconButton(
                                    iconSize: 20,
                                    color: Colors.red,
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              content: const Text(
                                                  'Do you really want to Delete?'),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    DeleteRelativesData()
                                                        .deleteRelativesData(
                                                            context, data.uuid);
                                                    showSnackbar(
                                                        context: context,
                                                        content:
                                                            "Item successfully Deleted",
                                                        color: Colors
                                                            .grey.shade500);

                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              kOrangeColor),
                                                  child: const Text('YES'),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              kOrangeColor),
                                                  child: const Text('NO'),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
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
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        : AddProfileScreen(
            allRelativeData: allRelative,
            onpressed: () {
              setState(() {
                _isAddProfile = !_isAddProfile;
              });
            },
          );
  }
}
