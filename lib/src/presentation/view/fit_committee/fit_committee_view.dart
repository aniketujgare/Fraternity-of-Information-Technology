import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/fit_committee.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/fit_committee_bloc/fit_committee_bloc.dart';
import '../../widgets/fit_circular_loading_indicator.dart';
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
                            fontSize: kHeadingFontSize,
                            color: kTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 800,
                      child: BlocConsumer<FitCommitteeBloc, FitCommitteeState>(
                        listener: (context, state) {
                          if (state is FitCommitteeErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)));
                          }
                        },
                        builder: (context, state) {
                          if (state is FitCommitteeLoadingState) {
                            return const Center(
                                child: FITCircularLoadingIndicator());
                          } else if (state is FitCommitteeLoadedState) {
                            final List<FitCommitteeModel> committeeList =
                                state.fitCommittee;
                            return ListView.builder(
                              itemCount: committeeList.length,
                              itemBuilder: (context, index) {
                                final member = committeeList[index];
                                return MemberCard(
                                  profilePic:
                                      'https://wallpapers.com/images/featured-full/kaneki-xsv5e4ut8mxmqae9.jpg',
                                  position: '${member.designation}',
                                  name: '${member.name}',
                                  year: 'Final Year',
                                  branch: 'Information Technnology',
                                  email: '${member.mail}',
                                  instagram: '${member.instagram}',
                                  linkedin: '${member.linkedin}',
                                  phoneNumber: '${member.phone}',
                                );
                              },
                            );
                          }
                          return const Text('Something went wrong!');
                        },
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
