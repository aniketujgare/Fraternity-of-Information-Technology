import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/constants.dart';
import '../blocs/app_navigator_cubit/app_navigator_cubit.dart';

class FITBottomNavBar extends StatelessWidget {
  const FITBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 20,
        right: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildNavBarItems(
              index: 0,
              context: context,
              svgIcon: 'assets/images/home_icon.svg',
            ),
            buildNavBarItems(
              index: 1,
              context: context,
              svgIcon: 'assets/images/news_icon.svg',
            ),
            buildNavBarItems(
              index: 2,
              context: context,
              svgIcon: 'assets/images/gallery_icon.svg',
            ),
            buildNavBarItems(
              index: 3,
              context: context,
              svgIcon: 'assets/images/profile_icon.svg',
            ),
          ],
        ),
      ),
    );
  }

  buildNavBarItems({
    required BuildContext context,
    required String svgIcon,
    required int index,
  }) {
    return BlocBuilder<AppNavigatorCubit, AppNavigatorState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<AppNavigatorCubit>().gotoPageAtIndex(index);
          },
          iconSize: 24,
          splashRadius: 1,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          icon: SizedBox(
            height: 25,
            width: 25,
            child: SvgPicture.asset(
              svgIcon,
              colorFilter: ColorFilter.mode(
                state.index == index ? kPrimaryColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }
}
