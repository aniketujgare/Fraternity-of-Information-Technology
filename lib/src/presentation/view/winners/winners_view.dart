import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/event_winners_model.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/winners_bloc/winners_bloc.dart';
import '../../widgets/fit_circular_loading_indicator.dart';
import 'widgets/winners_card.dart';

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
              toolbarHeight: 100,
              leading: SizedBox(),
              centerTitle: true,
              floating: true,
              title: Text(
                'Winners Board',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
          ],
          body: BlocConsumer<WinnersBloc, WinnersState>(
            listener: (context, state) {
              if (state is WinnersErrorState) {
                kShowSnackBar(context, SnackType.error, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is WinnersLoadingState) {
                return const Center(child: FITCircularLoadingIndicator());
              } else if (state is WinnersLoadedState) {
                final List<EventWinnersModel> winnersList = state.winners;
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
              }
              return const Text('Something went wrong!');
            },
          ),
        ),
      ),
    );
  }
}
