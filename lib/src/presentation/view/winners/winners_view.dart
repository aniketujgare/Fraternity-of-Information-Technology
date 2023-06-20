import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'widgets/winners_card.dart';

class WinnersView extends StatelessWidget {
  const WinnersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(18),
                  child: Center(
                    child: Text(
                      'Winners board',
                      style: TextStyle(
                          fontSize: kHeadingFontSize,
                          color: kTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return const WinnersCard(headTitle: 'headTitle');
                    }),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
