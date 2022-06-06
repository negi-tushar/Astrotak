import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/widgets/custom_drop_down.dart';
import 'package:astrotak/widgets/custom_text_formfield.dart';
import 'package:astrotak/widgets/custom_toggleButton.dart';
import 'package:flutter/material.dart';

class AddProfileScreen extends StatefulWidget {
  AddProfileScreen({Key? key, required this.onpressed}) : super(key: key);
  final Function onpressed;
  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  String timeZone = 'AM';
  GlobalKey<FormState> _formKey = GlobalKey();

  void validator() {
    var validator = _formKey.currentState?.validate();
    if (!validator!) {
      return;
    }
    widget.onpressed();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onpressed();
                },
                child: const Icon(Icons.arrow_back_ios),
              ),
              const Text(
                ' Add new profile',
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 18),
              ),
            ],
          ),
        ),
        Form(
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: kFormFieldLabel,
                  ),
                  kheightSpacer(10.0),
                  TextFormField(
                    // textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) {
                      if (val!.isEmpty && val.length < 2) {
                        return "Enter valid Name";
                      }
                      return null;
                    },
                  ),
                  kheightSpacer(20.0),
                  const Text(
                    'Date Of birth',
                    style: kFormFieldLabel,
                  ),
                  kheightSpacer(10.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Expanded(
                        child: CustomTextFormField(
                          hintText: "DD",
                          maxlength: 2,
                        ),
                      ),
                      kWidthSpacer(10.0),
                      const Expanded(
                        child: CustomTextFormField(
                          hintText: "MM",
                          maxlength: 2,
                        ),
                      ),
                      kWidthSpacer(10.0),
                      const Expanded(
                        child: CustomTextFormField(
                          hintText: "YYYY",
                          maxlength: 4,
                        ),
                      ),
                    ],
                  ),
                  kheightSpacer(10.0),
                  const Text(
                    'Time Of birth',
                    style: kFormFieldLabel,
                  ),
                  kheightSpacer(10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Expanded(
                        child: CustomTextFormField(
                          hintText: "HH",
                          maxlength: 2,
                        ),
                      ),
                      kWidthSpacer(10.0),
                      const Expanded(
                        child: CustomTextFormField(
                          hintText: "MM",
                          maxlength: 2,
                        ),
                      ),
                      kWidthSpacer(10.0),
                      CustomToggleButton(timeZone: 'AM'),
                    ],
                  ),
                  kheightSpacer(10.0),
                  const Text(
                    'Place Of birth',
                    style: kFormFieldLabel,
                  ),
                  kheightSpacer(10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        isDense: true, border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please select a city";
                      }
                      return null;
                    },
                  ),
                  kheightSpacer(10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Gender',
                              style: kFormFieldLabel,
                            ),
                            CustomDropDownList(
                                hint: 'Gender', value: 'Male', items: gender)
                          ],
                        ),
                      ),
                      kWidthSpacer(10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Relation',
                              style: kFormFieldLabel,
                            ),
                            CustomDropDownList(
                                hint: 'Relation',
                                value: 'Father',
                                items: retation)
                          ],
                        ),
                      ),
                    ],
                  ),
                  kheightSpacer(10.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    child: ElevatedButton(
                      onPressed: validator,
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          elevation: 0,
                          // side: const BorderSide(color: kOrangeColor),
                          primary: kOrangeColor,
                          minimumSize: const Size(160, 40)),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  kheightSpacer(20.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
