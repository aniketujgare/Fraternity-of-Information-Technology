import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';

class UpcomingEventsCard extends StatelessWidget {
  final String headTitle;
  final String eventTitle;
  final String date;
  final String organizer;
  final double topMargin;
  const UpcomingEventsCard({
    Key? key,
    required this.date,
    required this.eventTitle,
    required this.organizer,
    this.topMargin = 20,
    required this.headTitle,
  }) : super(key: key);

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
        Container(
          margin: const EdgeInsets.all(15),
          width: 337,
          height: 234,
          decoration: BoxDecoration(
            color: kredColor,
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
                left: 25,
                top: 186,
                child: Container(
                  width: 148,
                  height: 31,
                  decoration: BoxDecoration(
                    color: kredDarkColor,
                    borderRadius: BorderRadius.circular(36.5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: FittedBox(
                        child: Text(
                          organizer,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 23.5,
                top: 101,
                child: SizedBox(
                  width: 320,
                  height: 88,
                  child: Text(
                    eventTitle,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      height: 0.9,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: 23,
                child: Container(
                  width: 109,
                  height: 31,
                  decoration: BoxDecoration(
                    color: kredBehindTextColor,
                    borderRadius: BorderRadius.circular(34.5),
                  ),
                  child: Center(
                    child: Text(
                      date,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.26,
                        color: Colors.white,
                      ),
                    ),
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
      ],
    );
  }
}
