import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_slider_event.dart';
part 'my_slider_state.dart';

class MySliderBloc extends Bloc<MySliderEvent, MySliderState> {
  MySliderBloc() : super(const MySliderInitial(value: 0)) {
    on<MySliderOnChangedEvent>(_onValueChanged);
  }

  _onValueChanged(MySliderOnChangedEvent event, emit) {
    emit(MySliderChangedLoading(value: event.value));
    emit(MySliderOnChanged(value: event.value));
  }
}
