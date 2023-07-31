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
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(18),
                  child: Center(
                    child: Text(
                      'Winners board',
                      style: TextStyle(
                          fontSize: kHeadingFontSize,
                          color: kTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: BlocConsumer<WinnersBloc, WinnersState>(
                    listener: (context, state) {
                      if (state is WinnersErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)));
                      }
                    },
                    builder: (context, state) {
                      if (state is WinnersLoadingState) {
                        return const Center(
                            child: FITCircularLoadingIndicator());
                      } else if (state is WinnersLoadedState) {
                        final List<EventWinnersModel> winnersList =
                            state.winners;
                        return ListView.builder(
                          itemCount: winnersList.length,
                          itemBuilder: (context, index) {
                            final winner = winnersList[index];
                            return WinnersCard(
                              eventName: '${winner.eventName}',
                              organizer: '${winner.organizer}',
                              winners: winner.winners!,
                            );

                            //  ListTile(
                            //   title: Text('Year: ${winner.date}'),
                            //   subtitle: Text(
                            //       'Name: ${winner.eventName}, Department: ${winner.organizer}'),
                            // );
                          },
                        );
                      }
                      return const Text('Something went wrong!');
                    },
                  ),
                )
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: 10,
                //     itemBuilder: ((context, index) {
                //       return const WinnersCard(headTitle: 'headTitle');
                //     }),
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
