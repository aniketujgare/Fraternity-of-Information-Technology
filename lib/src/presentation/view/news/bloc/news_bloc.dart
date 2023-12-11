import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final DatabaseRepository databaseRepository;

  NewsBloc(this.databaseRepository) : super(const NewsState()) {
    on<NewsEvent>((events, emit) async {
      await events.map(load: (_) async => await _load(emit));
    });
  }

  _load(Emitter<NewsState> emit) async {
    try {
      if (state.newsList.isEmpty) {
        emit(state.copyWith(status: NewsStatus.loading));
        final news = await databaseRepository.fetchNewsData();
        emit(state.copyWith(status: NewsStatus.loaded, newsList: news));
      }
    } catch (e) {
      emit(state.copyWith(status: NewsStatus.error));
    }
  }
}
