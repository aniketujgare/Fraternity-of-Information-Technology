import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/news/widgets/news_card.dart';

import '../../../utils/constants/constants.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                toolbarHeight: 100,
                title: Row(
                  children: [
                    const Text(
                      'News',
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 46,
                      width: 133,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(76.5)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
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
