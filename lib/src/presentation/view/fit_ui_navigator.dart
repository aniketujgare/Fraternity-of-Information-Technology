import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/news/news_view.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/news/widgets/news_full_view.dart';
import '../blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../widgets/fit_app_bar.dart';
import 'gallery/gallery_view.dart';
import 'home/home_view.dart';
import 'user_profile/user_profile_view.dart';

class FITUINavigator extends StatelessWidget {
  const FITUINavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<AppNavigatorCubit, AppNavigatorState>(
                builder: (context, state) {
                  return IndexedStack(
                    index: state.index,
                    children: screenList,
                  );
                },
              ),
              const Align(
                  alignment: Alignment.bottomCenter, child: FITBottomNavBar()),
            ],
          ),
        ),
      ),
    );
  }
}

var screenList = [
  const HomeView(),
  const NewsFullView(),
  const GalleryView(),
  const UserProfileView(),
];
