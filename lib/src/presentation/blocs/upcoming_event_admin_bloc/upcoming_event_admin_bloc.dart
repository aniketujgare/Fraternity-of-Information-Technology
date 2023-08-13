import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'upcoming_event_admin_event.dart';
part 'upcoming_event_admin_state.dart';

class UpcomingEventAdminBloc
    extends Bloc<UpcomingEventAdminEvent, UpcomingEventAdminState> {
  UpcomingEventAdminBloc() : super(UpcomingEventAdminInitial()) {
    on<UpcomingEventAdminSubmit>(
      (event, emit) {
        // Perform submission logic here
        emit(UpcomingEventAdminSuccess());
      },
    );
    on<UpcomingEventAdminPickImage>(
      (event, emit) async {
        final pickedImage =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          emit(UpcomingEventAdminImagePicked(pickedImage.path));
        }
      },
    );
    on<UpcomingEventAdminPickDate>(
      (event, emit) {
        // Perform submission logic here
        emit(UpcomingEventAdminSuccess());
      },
    );
  }
}
