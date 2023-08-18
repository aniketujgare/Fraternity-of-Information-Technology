part of 'gallery_bloc.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

final class GalleryLoading extends GalleryState {}

class GalleryLoaded extends GalleryState {
  final List<GalleryModel> galleryList;

  const GalleryLoaded({required this.galleryList});
}

final class GalleryErrorState extends GalleryState {
  final String errorMessage;

  const GalleryErrorState(this.errorMessage);
}
