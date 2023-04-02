import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class FitBackButton extends StatelessWidget {
  final double height;
  final IconData icon;
  final Color color;
  const FitBackButton({
    super.key,
    this.height = 55,
    this.icon = Icons.arrow_back_ios_new,
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
        ),
        Positioned(
          top: 8,
          left: 17,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
