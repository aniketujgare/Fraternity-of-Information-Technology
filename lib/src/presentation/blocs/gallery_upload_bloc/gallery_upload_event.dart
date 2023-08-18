part of 'gallery_upload_bloc.dart';

sealed class GalleryUploadEvent extends Equatable {
  const GalleryUploadEvent();

  @override
  List<Object> get props => [];
}

final class ImagePickerEvent extends GalleryUploadEvent {}

final class PickImagesEvent extends GalleryUploadEvent {}

final class AddImagesEvent extends GalleryUploadEvent {}

final class RemoveImageEvent extends GalleryUploadEvent {
  final String imgName;

  const RemoveImageEvent({required this.imgName});

  @override
  List<Object> get props => [imgName];
}

final class UploadImagesEvent extends GalleryUploadEvent {
  final List<XFile> selectedImage;
  final String date;

  const UploadImagesEvent({required this.selectedImage, required this.date});
  @override
  List<Object> get props => [selectedImage, date];
}
