import 'package:flutter/material.dart';
import '../../../constants.dart';

class AgreementText extends StatelessWidget {
  const AgreementText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: RichText(
        text: const TextSpan(
          text: 'By pressing “Save” you will accept\n',
          style: TextStyle(
            color: Color(0XFF9FA6B6),
            fontSize: 18,
          ),
          children: [
            TextSpan(
                text: 'User Agreement',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor)),
            TextSpan(text: ' conditions'),
          ],
        ),
      ),
    );
  }
}
