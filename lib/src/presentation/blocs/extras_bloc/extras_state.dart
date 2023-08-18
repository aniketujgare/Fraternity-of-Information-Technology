part of 'extras_bloc.dart';

sealed class ExtrasState extends Equatable {
  const ExtrasState();

  @override
  List<Object> get props => [];
}

final class ExtrasLoading extends ExtrasState {}

final class ExtrasLoaded extends ExtrasState {
  final ExtrasModel extrasModel;

  const ExtrasLoaded({required this.extrasModel});
}

final class ExtrasErrorState extends ExtrasState {
  final String errorMessage;

  const ExtrasErrorState(this.errorMessage);
}
