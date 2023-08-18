import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/database_repository.dart';

part 'gallery_upload_event.dart';
part 'gallery_upload_state.dart';

class GalleryUploadBloc extends Bloc<GalleryUploadEvent, GalleryUploadState> {
  List<XFile> selectedImages = [];
  Set<String> selectedImageNames = {};
  GalleryUploadBloc() : super(GalleryUploadInitial()) {
    on<PickImagesEvent>((event, emit) async {
      try {
        List<XFile>? pickedImages = await ImagePicker()
            .pickMultiImage(imageQuality: 95, maxHeight: 1920);

        for (int i = 0; i < pickedImages.length; i++) {
          if (!selectedImageNames.contains(pickedImages[i].name)) {
            selectedImageNames.add(pickedImages[i].name);
            selectedImages.add(pickedImages[i]);
          }
        }

        emit(ImagePickerLoadingState());
        emit(ImagePickerLoaded(selectedImages: selectedImages));
      } catch (e) {
        emit(const ImagePickerErrorState('Error picking images'));
      }
    });

    on<RemoveImageEvent>((event, emit) async {
      selectedImages.removeWhere((image) => image.name == event.imgName);
      selectedImageNames.removeWhere((name) => name == event.imgName);
      emit(ImagePickerLoadingState());
      emit(ImagePickerLoaded(selectedImages: selectedImages));
    });

    on<UploadImagesEvent>((event, emit) async {
      emit(ImagesUploadingState());
      await DatabaseRepository()
          .uploadImagesToFirebase(event.selectedImage, event.date);
      emit(ImagesUploadComplete());
    });
  }
}
