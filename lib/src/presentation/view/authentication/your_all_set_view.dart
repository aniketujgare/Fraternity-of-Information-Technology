import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import '../../widgets/all_set_animation.dart';

class YourAllSetview extends StatelessWidget {
  final String text;
  const YourAllSetview({super.key, required this.text});

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
          const AllSetAnimation(),
          const Spacer(flex: 1),
          text != ''
              ? Text(
                  text,
                  style: const TextStyle(fontSize: 36, color: Colors.white),
                )
              : const Text(
                  'You\'re all set!',
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
