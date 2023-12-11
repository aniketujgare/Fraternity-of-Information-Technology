import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../utils/constants/constants.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';
import '../bloc/extras_bloc.dart';

Container gitHub() {
  return Container(
    width: double.maxFinite, //365,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
    decoration: BoxDecoration(
      color: const Color(0XFFEAF0FE),
      border: Border.all(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(
        8,
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x26000000),
          offset: Offset(0, 1.5),
          blurRadius: 0.8,
        ),
      ],
    ),

    child: ExpansionTile(
      collapsedShape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      textColor: Colors.black,
      title: const Text(
        'GitHub',
        style: TextStyle(
          fontSize: 16,
          color: Color(0XFF1E2E69),
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: BlocBuilder<ExtrasBloc, ExtrasState>(
            builder: (context, state) {
              switch (state.status) {
                case ExtrasStatus.loading:
                  return const FITCircularLoadingIndicator();
                case ExtrasStatus.loaded:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'The project is open source on GitHub. If you\'d like to contribute, you are always welcome to do so. ',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/images/github-mark-white.svg',
                            height: 25,
                            width: 25,
                            colorFilter: const ColorFilter.mode(
                                Colors.black, BlendMode.srcIn),
                          ),
                          TextButton(
                            onPressed: () => launchUrlString(
                              state.extrasModel!.github ?? '',
                              mode: LaunchMode.externalApplication,
                            ),
                            child: const Text(
                              'GitHub',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                default:
                  return Center(child: Text(state.errorMessage));
              }
            },
          ),
        ),
      ],
    ),
  );
}
