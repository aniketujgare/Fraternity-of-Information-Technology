import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:fraternity_of_information_technology/src/domain/models/extras_model.dart';

part 'extras_event.dart';
part 'extras_state.dart';

class ExtrasBloc extends Bloc<ExtrasEvent, ExtrasState> {
  final DatabaseRepository databaseRepository;
  ExtrasModel? extrasModel;
  ExtrasBloc({required this.databaseRepository}) : super(ExtrasLoading()) {
    on<LoadExtrasEvent>((event, emit) async {
      extrasModel ??= await databaseRepository.getExtras();
      if (extrasModel != null) {
        emit(ExtrasLoaded(extrasModel: extrasModel!));
      } else {
        emit(const ExtrasErrorState('Failed to load!'));
      }
    });
  }
}
