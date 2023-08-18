import 'package:flutter/material.dart';

import '../../../../domain/models/event_winners_model.dart';
import '../../../../utils/constants/constants.dart';

class WinnersCard extends StatelessWidget {
  final String eventName;
  final List<String> organizers;
  final String date;
  final List<Winner> winners;

  final double topMargin;

  const WinnersCard({
    Key? key,
    this.topMargin = 20,
    required this.eventName,
    required this.organizers,
    required this.winners,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).pushNamed(ScreenName.winnersVIew),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Title Of card
          Container(
            margin: const EdgeInsets.only(left: 25, bottom: 10),
            child: Text(
              eventName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xff6a87f3),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, bottom: 0, right: 25),
            width: double.maxFinite,
            height: 23,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // color: Colors.red,
                  height: 22,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Organizer - ${kOrganizersToString(organizers)}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Text(
                  kFormatDate(date),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          //* Card
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 5, left: 15, right: 15, bottom: 30),
              width: 344,
              height: 234,
              decoration: BoxDecoration(
                color: const Color(0xffc3e2ff),
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
                    right: -65,
                    bottom: -55,
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset(
                        'assets/images/FIT_logo.png',
                        color: Colors.white.withOpacity(0.16),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: ListView.separated(
                      itemCount: winners.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Divider(
                            color: Colors.grey.withOpacity(0.5),
                            thickness: 1,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 4),
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
                                width: 170,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      winners[index].name ?? '',
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        height: 1.26,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          winners[index].department ?? '',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            height: 1.26,
                                          ),
                                        ),
                                        Text(
                                          ' - ${winners[index].year}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            height: 1.26,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/winner_badge_${index + 1}.png',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
