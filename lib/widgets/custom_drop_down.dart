import 'package:astrotak/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  CustomDropDownList(
      {Key? key, required this.value, required this.items, required this.hint})
      : super(key: key);

  late String value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // value: widget.value,
      hint: Text(widget.hint),
      elevation: 5,
      isExpanded: true,
      isDense: true,
      borderRadius: BorderRadius.circular(10),
      items: widget.items,
      decoration: InputDecoration(border: OutlineInputBorder()),
      onChanged: (val) {
        setState(() {
          widget.value = val as String;
        });
      },
      validator: (val) {
        if (val == null) {
          return "Invalid ${widget.hint}";
        }
        return null;
      },
    );
  }
}
