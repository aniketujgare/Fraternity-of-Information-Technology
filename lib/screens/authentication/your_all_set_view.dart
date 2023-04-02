import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';

class YourAllSetview extends StatelessWidget {
  const YourAllSetview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kScaffoldColor, kSecondaryColor],
          // colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 0.8],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        children: [
          const Spacer(flex: 2),
          SvgPicture.asset('assets/images/all_set.svg'),
          const Spacer(flex: 1),
          const Text(
            'You\'re all set!',
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
