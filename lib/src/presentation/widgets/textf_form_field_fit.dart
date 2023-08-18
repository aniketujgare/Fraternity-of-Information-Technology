import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

class TextFormFieldFit extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool hideText;
  const TextFormFieldFit({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.hideText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hideText,
      controller: controller,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: const Color(0xffADB6C1),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffADB6C1),
        ),
        filled: true,
        fillColor: kTextFieldFillColor,
        focusColor: const Color(0xfff8f8f8),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffECEFF5)),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffECEFF5)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
