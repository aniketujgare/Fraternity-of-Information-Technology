import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final DatabaseRepository databaseRepository;
  ImagePickerBloc({required this.databaseRepository})
      : super(ImagePickerInitial()) {
    on<PickImageEvent>((event, emit) async {
      File? imgFile = await databaseRepository.pickImage();
      if (imgFile != null) {
        emit(ImageIsPicked(imageFile: imgFile));
      }
    });
    on<UploadImageEvent>((event, emit) async {
      String? imgUrl =
          await databaseRepository.uploadImage(imageFile: event.imageFile);
      if (imgUrl != null) {
        emit(ImageUploaded(imageUrl: imgUrl));
      }
    });
    on<InitImageEvent>((event, emit) async {
      var file = await createImageFileFromFirestore(event.image);
      emit(ImageIsPicked(imageFile: file));
    });
  }
}

Future<File> createImageFileFromFirestore(String imageUrl) async {
  // Fetch the image bytes from the URL
  http.Response response = await http.get(Uri.parse(imageUrl));
  Uint8List imageBytes = response.bodyBytes;

  // Get a temporary directory to save the image file
  Directory tempDir = await Directory.systemTemp.createTemp();
  String filePath =
      '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';

  // Write the image bytes to a file
  File imageFile = File(filePath);
  await imageFile.writeAsBytes(imageBytes);

  return imageFile;
}
