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

const kFormFieldLabel = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.w400,
  fontSize: 16,
);
const kWitelabbel = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

const kHeading = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
);
const kBottomStyle = TextStyle(
  wordSpacing: 2,
  color: Color.fromARGB(255, 219, 135, 11),
  fontSize: 14,
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
    DropdownMenuItem(value: "Father", child: Text("Father")),
    DropdownMenuItem(value: "Brother", child: Text("Brother")),
    DropdownMenuItem(value: "Spouse", child: Text("Spouse")),
    DropdownMenuItem(value: "Son", child: Text("Son")),
    DropdownMenuItem(value: "Uncle", child: Text("Uncle")),
    DropdownMenuItem(value: "Father in law", child: Text("Father in law")),
    DropdownMenuItem(value: "Brother in law", child: Text("Brother in law")),
    DropdownMenuItem(value: "Friend", child: Text("Friend")),
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
