part of 'gallery_bloc.dart';

enum GalleryStatus { initial, loading, loaded, error }

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default(GalleryStatus.initial) GalleryStatus status,
    @Default([]) List<GalleryModel> galleryList,
    @Default('Failed to load fit gallery!') String errorMessage,
  }) = Initial;
}
