import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LengthLimitingTextInputFormatter;
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

import '../../../../utils/constants/constants.dart';

class OtpBoxes extends StatefulWidget {
  final TextEditingController digit1;
  final TextEditingController digit2;
  final TextEditingController digit3;
  final TextEditingController digit4;
  final TextEditingController digit5;
  final TextEditingController digit6;
  const OtpBoxes(
      {super.key,
      required this.digit1,
      required this.digit2,
      required this.digit3,
      required this.digit4,
      required this.digit5,
      required this.digit6});

  @override
  State<OtpBoxes> createState() => _OtpBoxesState();
}

class _OtpBoxesState extends State<OtpBoxes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textFieldBox(context, widget.digit1, 1),
        textFieldBox(context, widget.digit2, 2),
        textFieldBox(context, widget.digit3, 3),
        textFieldBox(context, widget.digit4, 4),
        textFieldBox(context, widget.digit5, 5),
        textFieldBox(context, widget.digit6, 6),
      ],
    );
  }
}

SizedBox textFieldBox(
    BuildContext context, TextEditingController otpController, int fieldNo) {
  Color bordercol = const Color(0xffc2c8d0);
  return SizedBox(
    height: 45,
    width: 45,
    child: TextFormField(
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: kTextGreyColor,
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        } else if (fieldNo != 1 && value.isEmpty) {
          FocusScope.of(context).previousFocus();
        }
      },
      controller: otpController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 0, left: 3),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bordercol, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(11))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bordercol, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(11))),
      ),
    ),
  );
}
