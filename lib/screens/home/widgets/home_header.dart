import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.onPressed,
    this.lMargin = 28,
    this.tMargin = 15,
    this.rMargin = 28,
    this.bMargin = 0,
  });

  final double lMargin;
  final double tMargin;
  final double rMargin;
  final double bMargin;
  final String userAvatar;
  final String userName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(lMargin, tMargin, rMargin, bMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      userAvatar,
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 24,
                    height: 1.26,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text: 'hola! ',
                    ),
                    TextSpan(
                      text: userName,
                      style: const TextStyle(
                        fontSize: 24,
                        height: 1.26,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                splashRadius: 25,
                highlightColor: kSecondaryColor.withOpacity(0.2),
                focusColor: kSecondaryColor.withOpacity(0.2),
                splashColor: kPrimaryColor.withOpacity(0.2),
                onPressed: onPressed,
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: double.infinity,
            child: const Text(
              'Welcome to FIT!',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                height: 1.26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
