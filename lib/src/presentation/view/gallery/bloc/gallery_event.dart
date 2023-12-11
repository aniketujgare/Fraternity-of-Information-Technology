part of 'gallery_bloc.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.load() = LoadGallery;
  const factory GalleryEvent.loadOnNewPicAdded() =
      LoadGalleryOnNewPicAddedEvent;
}
