import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/gallery_model.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  List<GalleryModel>? galleryList;
  final DatabaseRepository databaseRepository;
  GalleryBloc({required this.databaseRepository}) : super(GalleryLoading()) {
    on<LoadGalleryEvent>(
      (event, emit) async {
        try {
          galleryList ??= await databaseRepository.fetchGalleryData();
          if (galleryList != null) {
            emit(GalleryLoaded(galleryList: galleryList!));
          }
        } catch (e) {
          emit(const GalleryErrorState('Failed to load the Gallery!!'));
        }
      },
    );
    on<LoadGalleryOnNewPicAddedEvent>(
      (event, emit) async {
        try {
          emit(GalleryLoading());
          // print(galleryList!.length);
          galleryList = await databaseRepository.fetchGalleryData();
          // if (galleryList != null) {
          emit(GalleryLoaded(galleryList: galleryList!));
          // print(galleryList!.length);
          // }
        } catch (e) {
          emit(const GalleryErrorState('Failed to load the Gallery!!'));
        }
      },
    );
  }
}
