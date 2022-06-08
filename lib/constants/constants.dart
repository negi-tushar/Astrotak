import 'package:flutter/material.dart';

//colors
const kOrangeColor = Colors.orange;
const kBlueColor = Color.fromARGB(255, 104, 17, 242);

//Spacer
kheightSpacer(value) {
  return SizedBox(
    height: value,
  );
}

kWidthSpacer(value) {
  return SizedBox(
    width: value,
  );
}

const kNormaltext = TextStyle(fontSize: 10);
const kTableColumntext = TextStyle(fontSize: 12, color: Colors.blue);

const kFormFieldLabel = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);
const kWitelabbel = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 11,
);

const kHeading = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 13,
);
const kBottomStyle = TextStyle(
  wordSpacing: 2,
  color: Color.fromARGB(255, 219, 135, 11),
  fontSize: 12,
);

List<DropdownMenuItem<String>> get dropdownItems {
  const List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "Love", child: Text("Love")),
    DropdownMenuItem(value: "Business", child: Text("Business")),
    DropdownMenuItem(value: "Education", child: Text("Education")),
    DropdownMenuItem(value: "Work", child: Text("Work")),
    DropdownMenuItem(value: "Self", child: Text("Self")),
    DropdownMenuItem(value: "Life", child: Text("Life")),
    DropdownMenuItem(value: "Money", child: Text("Money")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get gender {
  const List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "Male", child: Text("Male")),
    DropdownMenuItem(value: "Female", child: Text("Female")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get retation {
  const List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "1", child: Text("Father")),
    DropdownMenuItem(value: "2", child: Text("Mother")),
    DropdownMenuItem(value: "3", child: Text("Spouse")),
    DropdownMenuItem(value: "4", child: Text("Son")),
    DropdownMenuItem(value: "5", child: Text("Uncle")),
    DropdownMenuItem(value: "6", child: Text("Father in law")),
    DropdownMenuItem(value: "7", child: Text("Brother ")),
    DropdownMenuItem(value: "8", child: Text("Friend")),
  ];
  return menuItems;
}

const List questions = [
  'When is the right for me to introduce my boyfriend / girlfriend?',
  'Doubtful about taking my relationship to next level?',
  'How will I meet my potential life partner?',
  'Is my wife/husband failthful?',
  'Will I ever meet my true love?',
  'When will i get in relationship?',
];

void showSnackbar(
    {required BuildContext context,
    required String content,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: color,
    ),
  );
}
