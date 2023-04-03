import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/all_set_animation.dart';

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
      child: const Column(
        children: [
          Spacer(flex: 2),
          AllSetAnimation(),
          Spacer(flex: 1),
          Text(
            'You\'re all set!',
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
