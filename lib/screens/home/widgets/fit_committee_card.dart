import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class FITCommitteeCard extends StatelessWidget {
  final String headTitle;
  final String eventTitle;
  final String date;
  final String organizer;
  final double topMargin;

  const FITCommitteeCard({
    super.key,
    required this.date,
    required this.eventTitle,
    required this.organizer,
    this.topMargin = 20,
    required this.headTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Title Of card
        Container(
          margin: EdgeInsets.only(top: topMargin),
          padding: const EdgeInsets.only(left: 28),
          width: double.infinity,
          height: 31,
          child: Text(
            headTitle,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        //* Card
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, ScreenName.fitCommittee),
          child: Container(
            margin: const EdgeInsets.all(15),
            width: 337,
            height: 234,
            decoration: BoxDecoration(
              color: const Color(0xff6a87f3),
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  offset: Offset(0, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 30,
                  bottom: 30,
                  child: Text(
                    eventTitle,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: -65,
                  bottom: -50,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      'assets/images/FIT_logo.png',
                      color: Colors.white.withAlpha(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
