import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.title,
    required this.iconName,
    required this.titleValue,
  });

  final String title;
  final IconData iconName;
  final String titleValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              iconName,
              color: kTextFieldContentColor,
              size: 25,
            ),
            const SizedBox(
              width: 28,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: kTextGreyColor, fontSize: 14),
                ),
                Text(
                  titleValue,
                  style: const TextStyle(color: kTextColor, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Divider(
          thickness: 1,
          color: kTextGreyColor.withOpacity(0.2),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
