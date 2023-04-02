import 'package:flutter/material.dart';

class StudentAchievement extends StatelessWidget {
  final String headTitle;

  final double topMargin;

  const StudentAchievement({
    super.key,
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
            color: const Color(0xffd2a969),
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
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 49,
                          height: 49,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(avatars[1]),
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 180,
                          padding: const EdgeInsets.only(left: 28),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 93, 75, 47)
                                .withAlpha(40),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user[1]![0],
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  height: 1.26,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              Text(
                                user[1]![1],
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  ListView.separated(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 28, right: 28, top: 6, bottom: 6),
                        child: Text(
                          '${index + 1}. Downloaded COD',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 28, right: 28),
                        child: Divider(
                          color: Colors.white.withOpacity(0.5),
                          thickness: 1,
                        ),
                      );
                    },
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 28, right: 28),
                  //   child: Divider(
                  //     color: Colors.white,
                  //     thickness: 1,
                  //   ),
                  // ),
                ],
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
