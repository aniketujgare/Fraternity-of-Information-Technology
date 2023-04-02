import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

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
            color: kTextGreyColor,
            fontSize: 14,
          ),
          children: [
            TextSpan(
                text: 'User Agreement',
                style: TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor)),
            TextSpan(text: ' conditions.'),
          ],
        ),
      ),
    );
  }
}
