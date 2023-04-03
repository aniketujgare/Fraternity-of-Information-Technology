import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants.dart';

class FITCircularLoadingIndicator extends StatelessWidget {
  final double height, width, topMargin;
  const FITCircularLoadingIndicator({
    super.key,
    this.height = 50,
    this.width = 50,
    this.topMargin = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      height: height,
      width: height,
      child: Center(
        child: Lottie.asset(
          'assets/lotties/loading.json',
          delegates: LottieDelegates(
            text: (initialText) => '**$initialText**',
            values: [
              ValueDelegate.colorFilter(
                const ['**', 'Circle Green', '**'],
                value: const ColorFilter.mode(kPrimaryColor, BlendMode.src),
              ),
              ValueDelegate.colorFilter(
                const ['**', 'Circle Purple', '**'],
                value: const ColorFilter.mode(kSecondaryColor, BlendMode.src),
              ),
              // ValueDelegate.colorFilter(
              //   const ['**', 'Circle_Blue', '**'],
              //   value: ColorFilter.mode(
              //       Colors.white.withOpacity(0.4), BlendMode.src),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
