part of 'extras_bloc.dart';

sealed class ExtrasEvent extends Equatable {
  const ExtrasEvent();

  @override
  List<Object> get props => [];
}

final class LoadExtrasEvent extends ExtrasEvent {}
