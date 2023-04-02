import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'widgets/member_card.dart';

class FitCommitteeView extends StatelessWidget {
  const FitCommitteeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'FIT Committee',
                        style: TextStyle(
                            fontSize: 36,
                            color: kTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 800,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: ((context, index) {
                          return const MemberCard(
                            profilePic:
                                'https://wallpapers.com/images/featured-full/kaneki-xsv5e4ut8mxmqae9.jpg',
                            position: 'President',
                            name: 'Kunal Marathe',
                            year: 'Final Year',
                            branch: 'Information Technnology',
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
