part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends ImagePickerEvent {}

class UploadImageEvent extends ImagePickerEvent {
  final File imageFile;
  const UploadImageEvent({required this.imageFile});
  @override
  List<Object> get props => [imageFile];
}

class InitImageEvent extends ImagePickerEvent {
  final String image;
  const InitImageEvent({required this.image});
  @override
  List<Object> get props => [image];
}
