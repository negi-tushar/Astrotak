import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  CustomDropDownList(
      {Key? key,
      required this.value,
      required this.items,
      required this.hint,
      required this.onchange})
      : super(key: key);

  late String value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final Function(String val) onchange;
  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.value,
      hint: Text(widget.hint),
      elevation: 5,
      isExpanded: true,
      isDense: true,
      borderRadius: BorderRadius.circular(10),
      items: widget.items,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (val) {
        setState(() {
          widget.value = val as String;
        });
        widget.onchange(widget.value);
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
