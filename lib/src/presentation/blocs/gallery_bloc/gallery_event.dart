part of 'gallery_bloc.dart';

sealed class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

final class LoadGalleryEvent extends GalleryEvent {}

final class LoadGalleryOnNewPicAddedEvent extends GalleryEvent {}
