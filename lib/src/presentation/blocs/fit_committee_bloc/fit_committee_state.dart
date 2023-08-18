part of 'fit_committee_bloc.dart';

abstract class FitCommitteeState extends Equatable {
  const FitCommitteeState();

  @override
  List<Object> get props => [];
}

class FitCommitteeLoadingState extends FitCommitteeState {}

class FitCommitteeLoadedState extends FitCommitteeState {
  final List<FITCommitteeModel> fitCommittee;
  const FitCommitteeLoadedState({required this.fitCommittee});
  @override
  List<Object> get props => [fitCommittee];
}

class FitCommitteeErrorState extends FitCommitteeState {
  final String errorMessage;

  const FitCommitteeErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
