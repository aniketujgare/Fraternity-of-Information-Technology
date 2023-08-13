part of 'date_picker_cubit.dart';

abstract class DatePickerState extends Equatable {
  const DatePickerState();

  @override
  List<Object> get props => [];
}

class DatePickerInitial extends DatePickerState {}

class DateSelectedState extends DatePickerState {
  final String date;
  const DateSelectedState({required this.date});

  @override
  @override
  List<Object> get props => [date];
}
