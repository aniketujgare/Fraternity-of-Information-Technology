import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_account_event.dart';
part 'update_account_state.dart';

class UpdateAccountBloc extends Bloc<UpdateAccountEvent, UpdateAccountState> {
  UpdateAccountBloc() : super(UpdateAccountInitial()) {
    on<UpdateAccountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
