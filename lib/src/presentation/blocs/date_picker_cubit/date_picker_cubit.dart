import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';
part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerInitial());

  void pickDate(BuildContext context) async {
    final selctedDate = await showMonthPicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    // DateTime? selctedDate = await showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime.now(),
    //   lastDate: DateTime.now().add(
    //     const Duration(days: 365),
    //   ),
    // );
    if (selctedDate != null) {
      emit(DateSelectedState(date: selctedDate.toString()));
    }
  }

  void pickYear({required BuildContext context}) async {
    showDialog(
      context: context,
      builder: (context) {
        final Size size = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text('Admission Year'),
          // Changing default contentPadding to make the content looks better

          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          content: SizedBox(
            // Giving some size to the dialog so the gridview know its bounds

            height: size.height / 3,
            width: size.width,
            //  Creating a grid view with 3 elements per line.
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              children: [
                ...List.generate(
                  40,
                  (index) => InkWell(
                    onTap: () {
                      // The action you want to happen when you select the year below,
                      emit(DateSelectedState(
                          date: (DateTime.now().year - index).toString()));
                      context.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            // Showing the year text, it starts from 2022 and ends in 1900 (you can modify this as you like)
                            (DateTime.now().year - index).toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void initDate(String date) {
    emit(DateSelectedState(date: date));
  }
}
