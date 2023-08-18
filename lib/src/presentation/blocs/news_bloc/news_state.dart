part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitialState extends NewsState {}

final class NewsLoadedState extends NewsState {
  final List<NewsModel> newsList;

  const NewsLoadedState(this.newsList);
}

final class NewsErrorState extends NewsState {
  final String errorMessage;

  const NewsErrorState(this.errorMessage);
}
