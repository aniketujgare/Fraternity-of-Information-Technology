import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/constants.dart';
import '../widgets/developers.dart';
import '../widgets/downloadables.dart';
import '../widgets/fit_links.dart';
import '../widgets/github.dart';
import '../widgets/what_is_fit.dart';

class ExtrasView extends StatelessWidget {
  const ExtrasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            leadingWidth: 50,
            toolbarHeight: 70,
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: GestureDetector(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset(
                    'assets/images/back_button.svg',
                  )),
            ),
            title: const Text(
              'Extra\'s',
              style: TextStyle(
                fontSize: kHeading2FontSize,
              ),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              whatIsFIT(),
              downloadables(),
              const FitLinks(),
              developers(),
              gitHub(),
            ],
          ),
        ),
      ),
    );
  }
}
