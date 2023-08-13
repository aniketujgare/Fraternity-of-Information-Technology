import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/constants.dart';

class AllSetAnimation extends StatefulWidget {
  const AllSetAnimation({super.key});

  @override
  State<AllSetAnimation> createState() => _AllSetAnimationState();
}

class _AllSetAnimationState extends State<AllSetAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/all_set.json',
      controller: _controller,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
        // .whenComplete(
        //   () => context
        //       .pushReplacementNamed(AppRoutConstants.fitUiNavigator.name),
        // );
      },
      delegates: LottieDelegates(
        text: (initialText) => '**$initialText**',
        values: [
          ValueDelegate.colorFilter(
            const ['**', 'Tick', '**'],
            value: const ColorFilter.mode(kPrimaryColor, BlendMode.src),
          ),
          ValueDelegate.colorFilter(
            const ['**', 'Background Circle (Blue)', '**'],
            value: const ColorFilter.mode(Colors.white, BlendMode.src),
          ),
          ValueDelegate.colorFilter(
            const ['**', 'Background(Blue)', '**'],
            value: ColorFilter.mode(
                kSecondaryColor.withOpacity(0.2), BlendMode.src),
          ),
          ValueDelegate.colorFilter(
            const ['**', 'Glow', '**'],
            value: ColorFilter.mode(
                kSecondaryColor.withOpacity(0.4), BlendMode.src),
          ),
          //* small elements scattering around circle
          ...widgets
        ],
      ),
    );
  }

  var widgets = List.generate(11, (i) {
    double opacity = Random().nextDouble();
    return ValueDelegate.colorFilter(
      ['**', 'Element ${i + 1}', '**'],
      value: ColorFilter.mode(Colors.white.withOpacity(opacity), BlendMode.src),
    );
  });
}
