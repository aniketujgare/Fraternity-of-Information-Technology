import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FITTextShimmer extends StatelessWidget {
  final String text;
  final double fontSize;
  const FITTextShimmer({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
