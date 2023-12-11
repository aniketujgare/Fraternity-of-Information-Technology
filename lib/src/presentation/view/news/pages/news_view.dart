import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/constants.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_card.dart';

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
                if (state.status == NewsStatus.error) {
                  kShowSnackBar(
                      context, SnackType.error, 'Error Loading News!');
                }
              },
              builder: (context, state) {
                switch (state.status) {
                  case NewsStatus.initial:
                    return const Center(child: FITCircularLoadingIndicator());
                  case NewsStatus.loading:
                    return const Center(child: FITCircularLoadingIndicator());
                  case NewsStatus.loaded:
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 75),
                      itemCount: state.newsList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: NewsCard(newsModel: state.newsList[index]),
                      ),
                    );
                  case NewsStatus.error:
                    return Center(child: Text(state.errorMessage));
                }
              },
            )),
      ),
    );
  }
}
