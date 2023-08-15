import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/config/router/app_router_constants.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/honour_board_bloc/honour_board_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/widgets/text_shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

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
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutConstants.honourBoardView.name),
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
            height: 234,
            decoration: BoxDecoration(
              color: const Color(0xffd2a969),
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
                  bottom: -50,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      'assets/images/FIT_logo.png',
                      color: Colors.white.withAlpha(35),
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
                          BlocBuilder<HonourBoardBloc, HonourBoardState>(
                            builder: (context, state) {
                              if (state is HonourBoardLoaded) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  width: 49,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          state.honourBoard.first.profilePic),
                                    ),
                                  ),
                                );
                              } else {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    height: 49,
                                    width: 49,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    margin: const EdgeInsets.only(right: 20),
                                  ),
                                );
                              }
                            },
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
                                BlocBuilder<HonourBoardBloc, HonourBoardState>(
                                  builder: (context, state) {
                                    if (state is HonourBoardLoaded) {
                                      return Text(
                                        state.honourBoard.first.name,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          height: 1.26,
                                          color: Color(0xffffffff),
                                        ),
                                      );
                                    } else {
                                      return const FITTextShimmer(
                                          text: 'Loading...', fontSize: 17);
                                    }
                                  },
                                ),
                                BlocBuilder<HonourBoardBloc, HonourBoardState>(
                                  builder: (context, state) {
                                    if (state is HonourBoardLoaded) {
                                      return const Text(
                                        'IT - Final Year',
                                        style: TextStyle(
                                          fontSize: 13.3,
                                          fontWeight: FontWeight.w500,
                                          height: 1.26,
                                          color: Color(0xffffffff),
                                        ),
                                      );
                                    } else {
                                      return const FITTextShimmer(
                                          text: 'Loading...', fontSize: 17);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    BlocBuilder<HonourBoardBloc, HonourBoardState>(
                      builder: (context, state) {
                        if (state is HonourBoardLoaded) {
                          return ListView.separated(
                            itemCount:
                                state.honourBoard.first.achievements.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final achievements =
                                  state.honourBoard.first.achievements;
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 28, right: 28, top: 6, bottom: 6),
                                child: Text(
                                  '${index + 1}. ${achievements[index]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 28, right: 28),
                                child: Divider(
                                  color: Colors.white.withOpacity(0.5),
                                  thickness: 1,
                                ),
                              );
                            },
                          );
                        } else {
                          return const FITTextShimmer(
                              text: 'Loading...', fontSize: 17);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
