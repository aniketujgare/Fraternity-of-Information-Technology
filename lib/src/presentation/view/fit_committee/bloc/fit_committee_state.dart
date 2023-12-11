part of 'fit_committee_bloc.dart';

enum FitCommitteeStatus { initial, loading, loaded, error }

@freezed
class FitCommitteeState with _$FitCommitteeState {
  const factory FitCommitteeState({
    @Default(FitCommitteeStatus.initial) FitCommitteeStatus status,
    @Default([]) List<FITCommitteeModel> fitCommittee,
    @Default('Failed to load fit committee!') String errorMessage,
  }) = Initial;
}
