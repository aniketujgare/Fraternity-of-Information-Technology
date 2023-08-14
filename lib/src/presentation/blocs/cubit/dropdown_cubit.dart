import 'package:flutter_bloc/flutter_bloc.dart';

// part 'dropdown_state.dart';
enum DropdownState { option1, option2, option3 }

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(DropdownState.option1);

  void updateDropdown(DropdownState newState) {
    emit(newState);
  }
}
