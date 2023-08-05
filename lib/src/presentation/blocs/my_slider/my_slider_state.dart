part of 'my_slider_bloc.dart';

abstract class MySliderState extends Equatable {
  final int value;
  const MySliderState({required this.value});

  @override
  List<Object> get props => [value];
}

class MySliderInitial extends MySliderState {
  const MySliderInitial({required super.value});

  @override
  List<Object> get props => [];
}

class MySliderOnChanged extends MySliderState {
  const MySliderOnChanged({required super.value});

  @override
  List<Object> get props => [];
}

class MySliderChangedLoading extends MySliderState {
  const MySliderChangedLoading({required super.value});
}
