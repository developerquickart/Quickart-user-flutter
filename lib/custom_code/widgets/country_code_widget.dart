// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CountryCodeWidget extends StatefulWidget {
  const CountryCodeWidget({
    super.key,
    this.width,
    this.height,
    required this.dialCode,
  });

  final double? width;
  final double? height;
  final String dialCode;

  @override
  State<CountryCodeWidget> createState() => _CountryCodeWidgetState();
}

class _CountryCodeWidgetState extends State<CountryCodeWidget> {
  FocusNode focusNode = FocusNode();
  TextEditingController txtNumberC = TextEditingController();
  String dailCode1 = "AE";

  @override
  Widget build(BuildContext context) {
    if (FFAppState().phoneNo == null || FFAppState().phoneNo == "null") {
      txtNumberC.text = "";
    } else {
      txtNumberC.text = FFAppState().phoneNo;
      dailCode1 = FFAppState().dialCode;
    }

    return Container(
      child: IntlPhoneField(
        controller: txtNumberC,
        style: TextStyle(color: FFAppConstants.blackColor0A0A0A),
        decoration: InputDecoration(
          hintText: 'Enter Mobile Number',
          hintStyle: TextStyle(
              color: FFAppConstants.blackColor0A0A0A, fontFamily: 'Montserrat'),
          filled: true,
          fillColor: FFAppConstants.whiteColor,
          contentPadding: const EdgeInsets.only(
              left: 10.0, right: 20.0, bottom: 2.0, top: 15.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: FFAppConstants.textFieldBorderColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: FFAppConstants.textFieldBorderColor, width: 1.0),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        disableLengthCheck: false,
        initialCountryCode: dailCode1,
        dropdownTextStyle: TextStyle(
            color: FFAppConstants.blackColor0A0A0A, fontFamily: 'Montserrat'),
        onCountryChanged: (value) {
          FFAppState().dialCode = value.code;
          FFAppState().countryCode = value.dialCode.replaceAll("+", "");
        },
        onChanged: (phone) {
          FFAppState().dialCode = phone.countryISOCode;
          FFAppState().phoneNo = phone.number;
          FFAppState().countryCode = phone.countryCode.replaceAll("+", "");
        },
      ),
    );
  }
}
