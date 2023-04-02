import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fraternity_of_information_technology/bloc/app_navigator_cubit/app_navigator_cubit.dart';

class FITBottomNavBar extends StatelessWidget {
  const FITBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 15,
        right: 15,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(23),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: SvgPicture.asset(
                'assets/images/home_icon.svg',
              ),
              onTap: () {
                context.read<AppNavigatorCubit>().gotoPageAtIndex(0);
              },
            ),
            GestureDetector(
              child: SvgPicture.asset(
                'assets/images/notepad_icon.svg',
              ),
              onTap: () {
                context.read<AppNavigatorCubit>().gotoPageAtIndex(1);
              },
            ),
            GestureDetector(
              child: SvgPicture.asset(
                'assets/images/gallery_icon.svg',
              ),
              onTap: () {
                context.read<AppNavigatorCubit>().gotoPageAtIndex(2);
              },
            ),
            GestureDetector(
              child: SvgPicture.asset(
                'assets/images/profile_icon.svg',
              ),
              onTap: () {
                context.read<AppNavigatorCubit>().gotoPageAtIndex(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
