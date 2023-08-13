import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerInitial());

  void pickDate(BuildContext context) async {
    DateTime? selctedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (selctedDate != null) {
      emit(DateSelectedState(date: selctedDate.toString()));
    }
  }

  void initDate(String date) {
    emit(DateSelectedState(date: date));
  }
}
