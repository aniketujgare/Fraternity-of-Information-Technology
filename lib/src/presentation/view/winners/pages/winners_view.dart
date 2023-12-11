import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/event_winners_model.dart';
import '../../../../utils/constants/constants.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';
import '../bloc/winners_bloc/winners_bloc.dart';
import '../widgets/winners_card.dart';

class WinnersView extends StatelessWidget {
  const WinnersView({super.key});

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
                'Winners Board',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: kHeading2FontSize,
                ),
              ),
            ),
          ],
          body: BlocConsumer<WinnersBloc, WinnersState>(
            listener: (context, state) {
              if (state.status == WinnersStatus.error) {
                kShowSnackBar(context, SnackType.error, state.errorMessage);
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case WinnersStatus.loading:
                  return const Center(child: FITCircularLoadingIndicator());
                case WinnersStatus.loaded:
                  final List<EventWinnersModel> winnersList = state.winnersList;
                  return ListView.builder(
                    shrinkWrap: true,
                    // physics: AlwaysScrollableScrollPhysics(),
                    itemCount: winnersList.length,
                    itemBuilder: (context, index) {
                      final winner = winnersList[index];
                      return WinnersCard(
                        eventName: '${winner.eventName}',
                        organizers: winner.eventOrganizers ?? [],
                        date: '${winner.eventDate}',
                        winners: winner.winners!,
                      );
                    },
                  );
                default:
                  return const Center(child: Text('Something went wrong!'));
              }
            },
          ),
        ),
      ),
    );
  }
}
