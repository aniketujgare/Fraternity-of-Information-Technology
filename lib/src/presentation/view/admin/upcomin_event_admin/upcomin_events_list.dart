import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fraternity_of_information_technology/src/config/router/app_router_constants.dart';
import 'package:fraternity_of_information_technology/src/domain/models/all_event_model.dart';
import 'package:fraternity_of_information_technology/src/domain/models/upcoming_event_model.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/all_past_events/widgets/past_event_card.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/constants/constants.dart';
import '../../../blocs/upcoming_events/upcoming_events_bloc.dart';
import '../../home/widgets/upcoming_events.dart';

class UpcomingEventsList extends StatelessWidget {
  const UpcomingEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              floating: true,
              centerTitle: true,
              leading: Icon(Icons.arrow_back, color: kPrimaryColor),
              toolbarHeight: 75,
              title: Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 30,
                  color: kPrimaryColor,
                ),
              ),
            )
          ],
          body: BlocBuilder<UpcomingEventsBloc, UpcomingEventsState>(
            builder: (context, state) {
              if (state is UpcomingEventsLoadedState) {
                return ListView.builder(
                  itemCount: state.upcomingEvents.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 97,
                      width: double.maxFinite, //365,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 10.5),
                      decoration: BoxDecoration(
                        color: const Color(0XFFEAF0FE),
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            offset: Offset(0, 1.5),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 34),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    state.upcomingEvents[index].eventTitle,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color(0XFF000007),
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 3),
                                Text(
                                  state.upcomingEvents[index].date,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0XFF8E9090),
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => context.pushNamed(
                                AppRoutConstants.upcomingEventUpdate.name,
                                extra: state.upcomingEvents[index]),
                            child: const CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: Color(0XFFD1DEFA),
                              child: Icon(
                                Icons.arrow_outward,
                                color: Color(0XFF1E2E69),
                              ),
                            ),
                          ),
                          const SizedBox(width: 34),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return SizedBox(
                  height: 290,
                  width: double.infinity,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.all(30),
                      height: 290,
                      width: double.infinity,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

List<String> imgs = [
  'https://img.mensxp.com/media/content/2021/Jun/MX1400_60c201e0863f4.jpeg',
  'https://www.famousbollywood.com/wp-content/uploads/2021/07/Indori-Ishq-season-1.jpg',
  'https://images.bhaskarassets.com/thumb/1800x1800/web2images/521/2020/12/17/orig_03_1608162101.jpg',
  'https://images.thequint.com/thequint%2F2021-06%2F38b4ed7a-0da3-4ede-9f6f-558577ba81e3%2FScreenshot_2021_06_08_150134.png',
];

class Tile extends StatelessWidget {
  final int index;
  final String title;
  const Tile({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 155,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ));
  }
}
