import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.maxlength,
    required this.hintText,
  }) : super(key: key);
  final int maxlength;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      maxLength: maxlength,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          border: const OutlineInputBorder()),
      validator: (val) {
        if (val!.isEmpty) {
          return "Invalid $hintText";
        }
        return null;
      },
    );
  }
}
