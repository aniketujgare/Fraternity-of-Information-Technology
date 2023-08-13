import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';

class FitTextFormField extends StatelessWidget {
  const FitTextFormField({
    super.key,
    required this.label,
    required this.icon,
    this.horiPad = 25,
    this.topPad = 0,
    this.botPad = 0,
    required this.textFieldController,
    this.lines = 1,
  });

  final double horiPad, topPad, botPad;
  final IconData icon;
  final String label;
  final TextEditingController textFieldController;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horiPad, topPad, horiPad, botPad),
      child: TextFormField(
        controller: textFieldController,
        textAlign: TextAlign.start,
        maxLines: lines,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kTextFieldContentColor,
          ),
          hintText: label,
          hintStyle: const TextStyle(
            color: kTextFieldContentColor,
            // fontSize: 12,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 16,
            color: kTextFieldContentColor,
          ),
          filled: true,
          fillColor: kTextFieldFillColor,
          focusColor: kTextFieldContentColor,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kTextFieldBorderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          floatingLabelStyle: const TextStyle(
            fontSize: 18,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
