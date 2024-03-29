import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/widgets/fit_circular_loading_indicator.dart';

import '../../../utils/constants/constants.dart';
import '../../blocs/fit_committee_bloc/fit_committee_bloc.dart';
import 'widgets/member_card.dart';

class FitCommitteeView extends StatelessWidget {
  const FitCommitteeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverAppBar(
                    toolbarHeight: 70,
                    leading: SizedBox(),
                    centerTitle: true,
                    floating: true,
                    title: Text(
                      'FIT Committee',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: kHeading2FontSize,
                      ),
                    ),
                  ),
                ],
            body: BlocBuilder<FitCommitteeBloc, FitCommitteeState>(
              builder: (context, state) {
                if (state is FitCommitteeLoadedState) {
                  return ListView.builder(
                    itemCount: state.fitCommittee.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final committee = state.fitCommittee[index];
                      return ExpansionTile(
                          initiallyExpanded: index == 0,
                          tilePadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 2),
                          // backgroundColor: kGrayCardColor,
                          collapsedShape:
                              Border.all(color: Colors.grey.shade400),
                          shape: Border.all(color: Colors.transparent),
                          childrenPadding: const EdgeInsets.only(bottom: 25),
                          title: Text(state.fitCommittee[index].activeYear),
                          collapsedBackgroundColor: kGrayCardColor,
                          children: [
                            ListView.builder(
                              itemCount: committee.members.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index2) {
                                final member = committee.members[index2];
                                return MemberCard(
                                  profilePic: member.profilePic,
                                  position: member.designation,
                                  name: member.name,
                                  year: 'Final Year',
                                  branch: 'Information Technnology',
                                  email: member.mail,
                                  instagram: member.instagram,
                                  linkedin: member.linkedin,
                                  phoneNumber: member.phone,
                                );
                              },
                            ),
                          ]);
                    },
                  );
                }
                return const Center(child: FITCircularLoadingIndicator());
              },
            )),
      ),
    );
  }
}
