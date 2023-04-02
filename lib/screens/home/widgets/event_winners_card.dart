import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants.dart';

class EventWinnersCard extends StatelessWidget {
  final String headTitle;

  final double topMargin;

  const EventWinnersCard({
    Key? key,
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
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //* Card
        Container(
          margin: const EdgeInsets.all(15),
          width: 337,
          height: 274,
          decoration: BoxDecoration(
            color: kblueColor,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
                offset: Offset(4, 4),
                blurRadius: 2.5,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 25,
                top: 15,
                child: Container(
                  width: 148,
                  height: 31,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 14, 130, 197)
                        .withOpacity(0.4),
                    borderRadius: BorderRadius.circular(36.5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          'Tera Bhi Katega',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
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
                right: -79,
                bottom: -65,
                child: SizedBox(
                  width: 360,
                  height: 360,
                  child: Image.asset(
                    'assets/images/FIT_logo.png',
                    color: Colors.white.withOpacity(0.16),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          child: SvgPicture.asset(
                            'assets/images/winners_tile.svg',
                            color: const Color.fromARGB(255, 26, 94, 133)
                                .withOpacity(0.40),
                          ),
                        ),
                        Positioned(
                          top: 12.2,
                          left: 13.7,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 25),
                                width: 49,
                                height: 49,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(avatars[index]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 152,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user[index + 1]![0],
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        height: 1.26,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                    Text(
                                      user[index + 1]![1],
                                      style: const TextStyle(
                                        fontSize: 13.3,
                                        fontWeight: FontWeight.w500,
                                        height: 1.26,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 42,
                                width: 42,
                                child: Image.asset(
                                    'assets/images/winner_badge_${index + 1}.png'),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<String> avatars = [
  'https://c4.wallpaperflare.com/wallpaper/179/750/556/anime-boys-male-tongue-out-pierced-tongue-glasses-hd-wallpaper-preview.jpg',
  'https://c4.wallpaperflare.com/wallpaper/993/328/892/league-of-legends-video-games-adc-women-wallpaper-preview.jpg',
  'https://c4.wallpaperflare.com/wallpaper/410/558/539/anime-anime-girls-underboob-liang-xing-wallpaper-preview.jpg',
];

Map<int, List<String>> user = {
  1: [
    'Kunal Marathe',
    'First Year - IT',
  ],
  2: [
    'Tara Kutiyaa',
    'Second Year - IT',
  ],
  3: [
    'Elle Evans',
    'Second Year - IT',
  ],
};
