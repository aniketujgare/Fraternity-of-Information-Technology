import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/update_account_bloc/update_account_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/router/app_router_constants.dart';
import '../../../../utils/constants/constants.dart';
import '../../../widgets/text_shimmer.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.lMargin = 28,
    this.tMargin = 15,
    this.rMargin = 28,
    this.bMargin = 0,
  });

  final double lMargin;
  final double tMargin;
  final double rMargin;
  final double bMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(lMargin, tMargin, rMargin, bMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                builder: (context, state) {
                  if (state is FetchUserState) {
                    return ClipOval(
                      child: CachedNetworkImage(
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          imageUrl: state.userModel.profilePic ??
                              'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/images%2FIMG-20230620-WA0005.jpg?alt=media&token=f261198f-e266-4c56-a186-212872527431'),
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
                          borderRadius: BorderRadius.circular(25)),
                      margin: const EdgeInsets.only(right: 15),
                    ),
                  );
                },
              ),
              const SizedBox(width: 15),
              const Text(
                'hola! ',
                style: TextStyle(
                  fontSize: 24,
                  height: 1.26,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                builder: (context, state) {
                  if (state is FetchUserState) {
                    return Text(
                      state.userModel.name ?? 'Something wrong!!',
                      style: const TextStyle(
                        fontSize: 24,
                        height: 1.26,
                        color: kPrimaryColor,
                      ),
                    );
                  }
                  return const FITTextShimmer(fontSize: 24, text: 'Loading...');
                },
              ),
              const Spacer(),
              IconButton(
                splashRadius: 25,
                highlightColor: kSecondaryColor.withOpacity(0.2),
                focusColor: kSecondaryColor.withOpacity(0.2),
                splashColor: kPrimaryColor.withOpacity(0.2),
                onPressed: () =>
                    context.pushNamed(AppRoutConstants.notificationView.name),
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: double.infinity,
            child: const Text(
              'Welcome to FIT!',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                height: 1.26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
