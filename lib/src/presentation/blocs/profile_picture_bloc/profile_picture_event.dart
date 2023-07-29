part of 'profile_picture_bloc.dart';

abstract class ProfilePictureEvent extends Equatable {
  const ProfilePictureEvent();

  @override
  List<Object> get props => [];
}

// class PickImageEvent extends ProfilePictureEvent {
//   const PickImageEvent();
//   @override
//   List<Object> get props => [];
// }

class UploadImageEvent extends ProfilePictureEvent {
  final File imageFile;

  const UploadImageEvent({required this.imageFile});
  @override
  List<Object> get props => [imageFile];
}
