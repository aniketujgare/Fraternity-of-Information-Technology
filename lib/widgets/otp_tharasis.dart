import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LengthLimitingTextInputFormatter;
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

class OtpTharasis extends StatelessWidget {
  const OtpTharasis({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textFieldBox(context),
        textFieldBox(context),
        textFieldBox(context),
        textFieldBox(context),
      ],
    );
  }
}

SizedBox textFieldBox(BuildContext context) {
  Color bordercol = const Color(0xffc2c8d0);
  return SizedBox(
    height: 60,
    width: 60,
    child: Center(
      child: TextFormField(
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w500,
          color: Color(0xff1e232c),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff6a87f3), width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(11),
            ),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bordercol, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(11))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bordercol, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(11))),
        ),
        // onEditingComplete: () {
        //   bordercol = Color(0xff6a87f3);
        // },
      ),
    ),
  );
}
