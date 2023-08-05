part of 'my_slider_bloc.dart';

abstract class MySliderEvent extends Equatable {
  const MySliderEvent();

  @override
  List<Object> get props => [];
}

class MySliderOnChangedEvent extends MySliderEvent {
  final int value;
  const MySliderOnChangedEvent({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}
