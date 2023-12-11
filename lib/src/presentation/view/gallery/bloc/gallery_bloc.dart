import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/repositories/database_repository.dart';
import '../../../../domain/models/gallery_model.dart';

part 'gallery_bloc.freezed.dart';
part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final DatabaseRepository databaseRepository;

  GalleryBloc(this.databaseRepository) : super(const GalleryState()) {
    on<GalleryEvent>((events, emit) async {
      await events.map(
        load: (_) async => await _load(emit),
        loadOnNewPicAdded: (_) async => await _loadOnNewPicAdded(emit),
      );
    });
  }

  _load(Emitter<GalleryState> emit) async {
    try {
      if (state.galleryList.isEmpty) {
        emit(state.copyWith(status: GalleryStatus.loading));
        final gallery = await databaseRepository.fetchGalleryData();
        emit(
            state.copyWith(status: GalleryStatus.loaded, galleryList: gallery));
      }
    } catch (e) {
      emit(state.copyWith(status: GalleryStatus.error));
    }
  }

  _loadOnNewPicAdded(Emitter<GalleryState> emit) async {
    try {
      emit(state.copyWith(status: GalleryStatus.loading));
      final gallery = await databaseRepository.fetchGalleryData();
      emit(state.copyWith(status: GalleryStatus.loaded, galleryList: gallery));
    } catch (e) {
      emit(state.copyWith(status: GalleryStatus.error));
    }
  }
}
