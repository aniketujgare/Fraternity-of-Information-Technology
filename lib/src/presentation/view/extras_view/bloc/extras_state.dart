part of 'extras_bloc.dart';

enum ExtrasStatus { initial, loading, loaded, error }

@freezed
class ExtrasState with _$ExtrasState {
  const factory ExtrasState({
    @Default(ExtrasStatus.initial) ExtrasStatus status,
    @Default(null) ExtrasModel? extrasModel,
    @Default('Failed to load extras!') String errorMessage,
  }) = Initial;
}
