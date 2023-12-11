part of 'news_bloc.dart';

enum NewsStatus { initial, loading, loaded, error }

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(NewsStatus.initial) NewsStatus status,
    @Default([]) List<NewsModel> newsList,
    @Default('Failed to load news!') String errorMessage,
  }) = Initial;
}
