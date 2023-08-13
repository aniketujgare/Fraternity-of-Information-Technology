import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/random_winner_bloc/random_winner_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/widgets/text_shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/router/app_router_constants.dart';
import '../../../../utils/constants/constants.dart';

class EventWinnersCard extends StatelessWidget {
  final String headTitle;

  final double topMargin;

  const EventWinnersCard({
    Key? key,
    this.topMargin = 20,
    required this.headTitle,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutConstants.winnersView.name),
      child: Column(
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
            height: 290,
            decoration: BoxDecoration(
              color: kblueColor,
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
                  left: 20,
                  top: 15,
                  child: Container(
                    // width: 148,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 14, 130, 197)
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 15),
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child:
                              BlocBuilder<RandomWinnerBloc, RandomWinnerState>(
                            builder: (context, state) {
                              if (state is RandomWinnersLoadedState) {
                                return Text(
                                  state.winners.eventName ??
                                      'Event title is null',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    height: 1.26,
                                    color: Colors.white,
                                  ),
                                );
                              } else {
                                return const FITTextShimmer(
                                    text: 'Loading...', fontSize: 20);
                              }
                            },
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
                  margin: const EdgeInsets.only(top: 60),
                  child: BlocBuilder<RandomWinnerBloc, RandomWinnerState>(
                    builder: (context, state) {
                      if (state is RandomWinnersLoadedState) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.winners.winners!.length,
                          itemBuilder: (context, index) {
                            final winner = state.winners.winners;
                            return Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: WinnerTile(
                                name: winner![index].name ?? ' ',
                                department: winner[index].department ?? ' ',
                                year: winner[index].year ?? ' ',
                                index: index,
                              ),
                            );
                          },
                        );
                      } else {
                        return const Column(
                          children: [
                            WinnerTileShimmer(index: 0),
                            WinnerTileShimmer(index: 1),
                            WinnerTileShimmer(index: 2),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WinnerTileShimmer extends StatelessWidget {
  final int index;
  const WinnerTileShimmer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: SvgPicture.asset(
            'assets/images/winners_tile.svg',
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 26, 94, 133).withOpacity(0.40),
                BlendMode.srcIn),
          ),
        ),
        Positioned(
          top: 12.2,
          left: 13.7,
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 49,
                  width: 49,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  margin: const EdgeInsets.only(right: 25),
                ),
              ),
              const SizedBox(
                width: 152,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FITTextShimmer(text: 'Loading', fontSize: 18),
                    FITTextShimmer(text: 'Please wait.........', fontSize: 13),
                  ],
                ),
              ),
              SizedBox(
                height: 42,
                width: 42,
                child:
                    Image.asset('assets/images/winner_badge_${index + 1}.png'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class WinnerTile extends StatelessWidget {
  final String name;
  final String year;
  final String department;
  final String? profilePic;
  final int index;
  const WinnerTile({
    super.key,
    required this.name,
    required this.year,
    required this.department,
    this.profilePic,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: SvgPicture.asset(
            'assets/images/winners_tile.svg',
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 26, 94, 133).withOpacity(0.40),
                BlendMode.srcIn),
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
                    image: NetworkImage(avatars[0]),
                  ),
                ),
              ),
              SizedBox(
                width: 152,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.26,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Text(
                      '$department - $year',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.26,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 28,
              ),
              SizedBox(
                height: 42,
                width: 42,
                child:
                    Image.asset('assets/images/winner_badge_${index + 1}.png'),
              ),
            ],
          ),
        )
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
