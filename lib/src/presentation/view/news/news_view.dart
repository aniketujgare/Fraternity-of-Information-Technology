import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'widgets/news_card.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverAppBar(
                toolbarHeight: 100,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'News',
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    // const Spacer(),
                    // Container(
                    //   height: 46,
                    //   width: 133,
                    //   decoration: BoxDecoration(
                    //       color: kPrimaryColor,
                    //       borderRadius: BorderRadius.circular(76.5)),
                    //   child: const Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         'New ',
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       Icon(
                    //         Icons.add,
                    //         size: 15,
                    //         color: Colors.white,
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              )
            ],
            body: const Column(
              children: [
                NewsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
