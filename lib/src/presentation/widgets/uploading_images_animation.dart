import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UploadingImagesAnimation extends StatefulWidget {
  const UploadingImagesAnimation({super.key});

  @override
  State<UploadingImagesAnimation> createState() =>
      _UploadingImagesAnimationState();
}

class _UploadingImagesAnimationState extends State<UploadingImagesAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/uploading.json',
      // controller: _controller,
      repeat: true,
      // onLoaded: onLoaded,
    );
  }

  onLoaded(composition) {
    // _controller..duration = composition.d;
    _controller
      ..duration = composition.duration
      ..forward().whenComplete(() => null);
  }
}
