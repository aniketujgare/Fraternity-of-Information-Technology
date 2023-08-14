import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:fraternity_of_information_technology/src/domain/models/upcoming_event_model.dart';
import 'package:fraternity_of_information_technology/src/presentation/blocs/image_picker_bloc/image_picker_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'upcoming_event_admin_event.dart';
part 'upcoming_event_admin_state.dart';

class UpcomingEventAdminBloc
    extends Bloc<UpcomingEventAdminEvent, UpcomingEventAdminState> {
  UpcomingEventAdminBloc() : super(UpcomingEventAdminInitial()) {
    on<UpcomingEventAdminSubmit>(
      (event, emit) async {
        emit(UpcomingEventAdminLoading());
        //upload image
        String? image =
            await DatabaseRepository().uploadImage(imageFile: event.imageFile);
        emit(ImageUploadedInDBState(imageUrl: image!));
      },
    );
    on<UploadToDBEvent>(
      (event, emit) async {
        emit(UpcomingEventAdminLoading());

        await DatabaseRepository().addUpcominEventToFirestore(event.eventModel);
        emit(UpcomingEventAdminSuccess());
        //add img url to event model

        //add to firestore
        // emit(UpcomingEventAdminSuccess());
      },
    );
    on<UpcomingEventAdminPickImage>(
      (event, emit) async {
        emit(UpcomingEventAdminLoading());

        final pickedImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          emit(UpcomingEventAdminImagePicked(pickedImage.path));
        }
      },
    );
    on<UpcomingEventAdminPickDate>(
      (event, emit) {
        emit(UpcomingEventAdminLoading());

        // Perform submission logic here
        emit(UpcomingEventAdminSuccess());
      },
    );
  }
}
