part of 'fit_committee_bloc.dart';

abstract class FitCommitteeEvent extends Equatable {
  const FitCommitteeEvent();

  @override
  List<Object> get props => [];
}

class FetchFitCommitteeEvent extends FitCommitteeEvent {}
