import 'package:astrotak/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  CustomToggleButton({Key? key, required this.timeZone, required this.onchange})
      : super(key: key);
  late String timeZone;
  final Function(String val) onchange;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late List<bool> isSelected = [
    widget.timeZone == 'AM',
    widget.timeZone == 'PM'
  ];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: const BoxConstraints(
          minHeight: 50,
          minWidth: 50,
          maxHeight: 60,
          maxWidth: double.infinity),
      direction: Axis.horizontal,
      disabledBorderColor: Colors.black,
      borderRadius: BorderRadius.circular(5),
      color: Colors.black,
      selectedColor: Colors.white,
      focusColor: Colors.black,
      fillColor: kBlueColor,
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
              widget.timeZone = 'PM';
            } else {
              isSelected[buttonIndex] = false;
              widget.timeZone = 'AM';
            }
          }
        });
        widget.onchange(widget.timeZone);
      },
      isSelected: isSelected,
      children: const [
        Text('AM'),
        Text('PM'),
      ],
    );
  }
}
