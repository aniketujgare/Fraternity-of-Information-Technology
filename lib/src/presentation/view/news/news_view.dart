import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/constants.dart';
import '../../blocs/news_bloc/news_bloc.dart';
import '../../widgets/fit_circular_loading_indicator.dart';
import 'widgets/news_card.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverAppBar(
                    toolbarHeight: 80,
                    title: Text(
                      'News',
                      style: TextStyle(
                        fontSize: kHeading1FontSize,
                      ),
                    ),
                  )
                ],
            body: BlocConsumer<NewsBloc, NewsState>(
              listener: (context, state) {
                if (state is NewsErrorState) {
                  kShowSnackBar(
                      context, SnackType.error, 'Error Loading News!');
                }
              },
              builder: (context, state) {
                if (state is NewsLoadedState) {
                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 75),
                    itemCount: state.newsList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: NewsCard(newsModel: state.newsList[index]),
                    ),
                  );
                }
                return const Center(child: FITCircularLoadingIndicator());
              },
            )),
      ),
    );
  }
}
