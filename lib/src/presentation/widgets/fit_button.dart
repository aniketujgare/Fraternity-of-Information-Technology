import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/constants.dart';

class FitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color bgColor, textColor, outlineColor;
  final double tMargin, bMargin, hMargin;
  final double height;
  final bool showArrow, showUpload, border;
  const FitButton({
    super.key,
    required this.onTap,
    required this.text,
    this.bgColor = kPrimaryColor,
    this.textColor = Colors.white,
    this.tMargin = 0,
    this.bMargin = 0,
    this.height = 40,
    this.hMargin = 25,
    this.showArrow = true,
    this.showUpload = false,
    this.border = false,
    this.outlineColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: hMargin, right: hMargin, top: tMargin, bottom: bMargin),
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: border ? Border.all(color: Colors.black) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showUpload)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset('assets/images/Upload.svg'),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
                if (showArrow)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
