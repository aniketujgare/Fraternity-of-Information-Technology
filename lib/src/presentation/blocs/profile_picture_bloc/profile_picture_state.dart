part of 'profile_picture_bloc.dart';

class ImageState {
  final bool isLoading;
  final String? imageURL;

  const ImageState({required this.isLoading, this.imageURL});
}
