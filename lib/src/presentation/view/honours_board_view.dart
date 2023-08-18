import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../blocs/honour_board_bloc/honour_board_bloc.dart';
import '../widgets/fit_circular_loading_indicator.dart';
import '../widgets/text_shimmer.dart';

class HonoursBoardView extends StatelessWidget {
  const HonoursBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverAppBar(
                toolbarHeight: 100,
                leading: SizedBox(),
                centerTitle: true,
                floating: true,
                title: Text(
                  'Honours board',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
            ],
            body: BlocBuilder<HonourBoardBloc, HonourBoardState>(
              builder: (context, state) {
                if (state is HonourBoardLoading) {
                  return const Center(child: FITCircularLoadingIndicator());
                } else if (state is HonourBoardLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.honourBoard.length,
                    itemBuilder: (context, index) {
                      final honorStudent = state.honourBoard[index];
                      return HonourCard(
                        profilePic: honorStudent.profilePic,
                        achievents: honorStudent.achievements,
                        name: honorStudent.name,
                        department: honorStudent.department,
                        year: honorStudent.year,
                      );
                    },
                  );
                } else {
                  return const Text('somthing went wrong');
                }
              },
            ),
          ),
        ));
  }
}

class HonourCard extends StatelessWidget {
  final String profilePic;
  final String name;
  final String department;
  final String year;
  final List<String> achievents;
  const HonourCard({
    required this.profilePic,
    required this.achievents,
    super.key,
    required this.name,
    required this.department,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            padding: const EdgeInsets.only(left: 28, right: 28),
            // height: 150,
            width: 337,
            decoration: BoxDecoration(
              color: const Color(0XFFF7F8F9),
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  offset: Offset(0, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 100),
                BlocBuilder<HonourBoardBloc, HonourBoardState>(
                  builder: (context, state) {
                    if (state is HonourBoardLoaded) {
                      return ListView.separated(
                        itemCount: achievents.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 28, top: 6, bottom: 6),
                            child: Text(
                              '${index + 1}. ${achievents[index]}',
                              style: const TextStyle(
                                color: Color(0xff312F2F),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 28),
                            child: Divider(
                              color: const Color(0xff312F2F).withOpacity(0.1),
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
                const SizedBox(height: 25),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            padding: const EdgeInsets.only(left: 28, right: 28),
            width: 337,
            height: 75,
            decoration: BoxDecoration(
                color: const Color(0XFFFFE8C3),
                borderRadius: BorderRadius.circular(28)),
            child: Row(
              children: [
                BlocBuilder<HonourBoardBloc, HonourBoardState>(
                  builder: (context, state) {
                    if (state is HonourBoardLoaded) {
                      return ClipOval(
                        child: CachedNetworkImage(
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                            imageUrl: profilePic),
                      );
                    }
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28)),
                        margin: const EdgeInsets.only(right: 15),
                      ),
                    );
                  },
                ),
                Container(
                  height: 55,
                  width: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(28),
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
                              name,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                height: 1.26,
                                color: Color(0xff312F2F),
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
                            return Text(
                              '$department - $year',
                              style: const TextStyle(
                                fontSize: 13.3,
                                fontWeight: FontWeight.w500,
                                height: 1.26,
                                color: Color(0xff312F2F),
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
        ],
      ),
    );
  }
}
