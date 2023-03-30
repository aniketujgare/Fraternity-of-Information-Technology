import 'package:flutter/material.dart';

import '../../../constants.dart';

class FitTextFormField extends StatelessWidget {
  const FitTextFormField({
    super.key,
    required this.label,
    required this.icon,
    this.horiPad = 25,
    this.topPad = 0,
    this.botPad = 0,
  });

  final double horiPad, topPad, botPad;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horiPad, topPad, horiPad, botPad),
      child: TextFormField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: const Color(0xffADB6C1),
          ),
          hintText: label,
          hintStyle: const TextStyle(
            color: Color(0xffADB6C1),
            // fontSize: 12,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xffADB6C1),
          ),
          filled: true,
          fillColor: kTextFieldColor,
          focusColor: const Color(0xfff8f8f8),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff6a87f3), width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffECEFF5)),
            borderRadius: BorderRadius.circular(12),
          ),
          floatingLabelStyle: const TextStyle(
            fontSize: 18,
            color: Color(0xff6a87f3),
          ),
        ),
      ),
    );
  }
}
