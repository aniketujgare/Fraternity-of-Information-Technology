import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';

import '../../../domain/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final DatabaseRepository databaseRepository;
  List<NewsModel>? newsList;
  NewsBloc({required this.databaseRepository}) : super(NewsInitialState()) {
    on<LoadNewsEvent>((event, emit) async {
      try {
        newsList ??= await databaseRepository.fetchNewsData();
        if (newsList != null) {
          emit(NewsLoadedState(newsList!));
        }
      } catch (e) {
        emit(const NewsErrorState('Error loading news'));
      }
    });
  }
}
