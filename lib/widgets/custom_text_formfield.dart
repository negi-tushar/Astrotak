import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.maxlength,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  final int maxlength;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
