part of 'gallery_upload_bloc.dart';

sealed class GalleryUploadState extends Equatable {
  const GalleryUploadState();

  @override
  List<Object> get props => [];
}

final class GalleryUploadInitial extends GalleryUploadState {}

final class ImagePickerLoaded extends GalleryUploadState {
  final List<XFile> selectedImages;

  const ImagePickerLoaded({required this.selectedImages});

  @override
  List<Object> get props => [selectedImages];
}

final class ImagePickerLoadingState extends GalleryUploadState {}

final class ImagePickerErrorState extends GalleryUploadState {
  final String errorMessage;

  const ImagePickerErrorState(this.errorMessage);
}

final class ImagesUploadingState extends GalleryUploadState {}

final class ImagesUploadComplete extends GalleryUploadState {}
