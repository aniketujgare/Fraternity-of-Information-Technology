import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLinkButton extends StatelessWidget {
  const SocialLinkButton({super.key, this.icon, this.onTap});
  final dynamic icon;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: SvgPicture.asset('assets/images/$icon'),
      ),
    );
  }
}
