part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();

  @override
  List<Object> get props => [];
}

class ImagePickerInitial extends ImagePickerState {}

class ImageIsPicked extends ImagePickerState {
  final File imageFile;
  const ImageIsPicked({required this.imageFile});
  @override
  List<Object> get props => [imageFile];
}

class ImageUploaded extends ImagePickerState {
  final String imageUrl;
  const ImageUploaded({required this.imageUrl});
  @override
  List<Object> get props => [imageUrl];
}
