import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TextFormFieldFit extends StatelessWidget {
  final String hintText;
  const TextFormFieldFit({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone_outlined,
          color: Color(0xffADB6C1),
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
