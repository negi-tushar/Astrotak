import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/data/model/relatives.dart';
import 'package:astrotak/data/services/get_place.dart';
import 'package:astrotak/data/services/set_relatives.dart';
import 'package:astrotak/widgets/custom_drop_down.dart';
import 'package:astrotak/widgets/custom_text_formfield.dart';
import 'package:astrotak/widgets/custom_toggleButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddProfileScreen extends StatefulWidget {
  AddProfileScreen({Key? key, required this.onpressed, this.allRelativeData})
      : super(key: key);
  final Function onpressed;
  AllRelative? allRelativeData;
  static const String id = '/AddProfileScreen';
  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  String timeZone = 'AM';
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<BirthPlace>? birthPlaceList = [];
  BirthPlace birthPlace = BirthPlace(placeName: '', placeId: '');
  String relationValue = '1';
  String genderValue = 'Male';
  bool _isupdate = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dd = TextEditingController();

  final TextEditingController _mm = TextEditingController();

  final TextEditingController _yyyy = TextEditingController();
  final TextEditingController _min = TextEditingController();
  final TextEditingController _hh = TextEditingController();

  final TextEditingController _birthPlaceController = TextEditingController();
  // ignore: prefer_final_fields

  void validator() {
    var validator = _formKey.currentState?.validate();
    if (!validator!) {
      return;
    }
    print(_isupdate);
    if (_isupdate) {
      SetRelativesData().setRelativesData(
          url:
              'https://staging-api.astrotak.com/api/relative/update/${widget.allRelativeData!.uuid}',
          birthDetails: BirthDetails(
              dobYear: int.parse(_yyyy.text),
              dobMonth: int.parse(_mm.text),
              dobDay: int.parse(_dd.text),
              tobHour: int.parse(_hh.text),
              meridiem: timeZone,
              tobMin: int.parse(_min.text)),
          birthPlace: birthPlace,
          context: context,
          firstName: _name.text,
          gender: genderValue,
          lastName: '',
          relationId: int.parse(relationValue));
    } else {
      SetRelativesData().setRelativesData(
        url: 'https://staging-api.astrotak.com/api/relative',
        birthDetails: BirthDetails(
            dobYear: int.parse(_yyyy.text),
            dobMonth: int.parse(_mm.text),
            dobDay: int.parse(_dd.text),
            tobHour: int.parse(_hh.text),
            meridiem: timeZone,
            tobMin: int.parse(_min.text)),
        birthPlace: birthPlace,
        context: context,
        firstName: _name.text,
        gender: genderValue,
        lastName: '',
        relationId: int.parse(relationValue),
      );
    }

    widget.onpressed();
  }

  @override
  void didChangeDependencies() {
    print('called');
    super.didChangeDependencies();
    if (widget.allRelativeData == null) {
      return;
    }
    _name.text = widget.allRelativeData!.fullName;
    _birthPlaceController.text = widget.allRelativeData!.birthPlace.placeName;
    _dd.text = widget.allRelativeData!.birthDetails.dobDay.toString();
    _mm.text = widget.allRelativeData!.birthDetails.dobMonth.toString();
    _yyyy.text = widget.allRelativeData!.birthDetails.dobYear.toString();
    _hh.text = widget.allRelativeData!.birthDetails.tobHour.toString();
    _min.text = widget.allRelativeData!.birthDetails.tobMin.toString();
    genderValue = widget.allRelativeData!.gender;
    relationValue = widget.allRelativeData!.relationId.toString();
    timeZone = widget.allRelativeData!.birthDetails.meridiem;
    birthPlace.placeName = widget.allRelativeData!.birthPlace.placeName;
    birthPlace.placeId = widget.allRelativeData!.birthPlace.placeId;
    setState(() {
      _isupdate = true;
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _dd.dispose();
    _mm.dispose();
    _yyyy.dispose();
    _min.dispose();
    _birthPlaceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
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
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
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
                        controller: _name,
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
                          Expanded(
                            child: CustomTextFormField(
                              controller: _dd,
                              hintText: "DD",
                              maxlength: 2,
                            ),
                          ),
                          kWidthSpacer(10.0),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _mm,
                              hintText: "MM",
                              maxlength: 2,
                            ),
                          ),
                          kWidthSpacer(10.0),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _yyyy,
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
                          Expanded(
                            child: CustomTextFormField(
                              controller: _hh,
                              hintText: "HH",
                              maxlength: 2,
                            ),
                          ),
                          kWidthSpacer(10.0),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _min,
                              hintText: "MM",
                              maxlength: 2,
                            ),
                          ),
                          kWidthSpacer(10.0),
                          CustomToggleButton(
                            timeZone: timeZone,
                            onchange: (val) {
                              setState(() {
                                timeZone = val;
                              });
                            },
                          ),
                        ],
                      ),
                      kheightSpacer(10.0),
                      const Text(
                        'Place Of birth',
                        style: kFormFieldLabel,
                      ),
                      kheightSpacer(10.0),
                      TypeAheadFormField(
                        hideOnEmpty: true,
                        hideOnLoading: true,
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _birthPlaceController,
                          decoration: const InputDecoration(
                              isDense: true, border: OutlineInputBorder()),
                        ),
                        suggestionsCallback: ((pattern) {
                          return GetPlace().getPlaceDetails(pattern);
                        }),
                        itemBuilder: (context, BirthPlace suggetstion) {
                          return ListTile(
                            leading: Text(suggetstion.placeName),
                          );
                        },
                        onSuggestionSelected: (BirthPlace suggestion) {
                          setState(() {
                            _birthPlaceController.text = suggestion.placeName;
                            birthPlace = suggestion;
                          });
                          print(birthPlace.placeName);
                        },
                        suggestionsBoxDecoration:
                            const SuggestionsBoxDecoration(
                                shape: OutlineInputBorder()),
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
                                kheightSpacer(5.0),
                                CustomDropDownList(
                                    onchange: (val) {
                                      setState(() {
                                        genderValue = val;
                                      });
                                    },
                                    hint: 'Gender',
                                    value: genderValue,
                                    items: gender)
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
                                kheightSpacer(5.0),
                                CustomDropDownList(
                                    onchange: (val) {
                                      setState(() {
                                        relationValue = val;
                                      });
                                    },
                                    hint: 'Relation',
                                    value: relationValue,
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
        ),
      ),
    );
  }
}
