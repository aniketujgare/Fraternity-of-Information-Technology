import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_picture_event.dart';
part 'profile_picture_state.dart';

class ProfilePictureBloc extends Bloc<ProfilePictureEvent, ImageState> {
  ProfilePictureBloc() : super(const ImageState(isLoading: false)) {
    //   on<PickImageEvent>(
    //     (event, emit) async {
    //       emit(const ImageState(isLoading: true));
    //       final ImagePicker picker = ImagePicker();

    //       final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //       if (pickedFile == null) {
    //         emit(const ImageState(isLoading: false));
    //         return;
    //       }
    //       try {
    //         final file = File(pickedFile.path);
    //         // Create a unique filename for the image
    //         final fileName = basename(file.path);
    //         // Get a reference to the Firebase storage location
    //         Reference firebaseStorageRef = firebase_storage
    //             .FirebaseStorage.instance
    //             .ref()
    //             .child('images/$fileName');
    //         // Upload the file to Firebase storage
    //         UploadTask uploadTask = firebaseStorageRef.putFile(file);
    //         // Get the download URL of the uploaded image
    //         String? url;
    //         await uploadTask.then((res) async {
    //           // Get the download URL of the uploaded image
    //           url = await res.ref.getDownloadURL();
    //         });
    //         print('Image url ${url}');
    //         var user = FirebaseAuth.instance.currentUser;
    //         var userModel = UserModel(docID: user!.uid, profilePic: url);
    //         DatabaseRepository().updateUser(userModel);
    //         emit(ImageState(isLoading: false, imageURL: url));
    //       } catch (e) {
    //         print('Error uploading image to Firebase: $e');
    //       }
    //     },
    //   );
    //   on<UploadImageEvent>(
    //     (event, emit) async {
    //       try {
    //         final imageFile = event.imageFile;

    //         // Create a unique filename for the image
    //         String fileName = path.basename(imageFile.path);
    //         String firebasePath = 'images/$fileName';

    //         // Get a reference to the Firebase storage location
    //         print('firebase path ${firebasePath}');
    //         Reference ref = FirebaseStorage.instance.ref().child(firebasePath);

    //         // Upload the file to Firebase storage
    //         TaskSnapshot uploadTask = await ref.putFile(imageFile);

    //         // Get the download URL of the uploaded image
    //         String downloadURL = await uploadTask.ref.getDownloadURL();

    //         emit(ImageState(isLoading: false, imageURL: downloadURL));
    //       } catch (e) {
    //         print('Error uploading image to Firebase: $e');
    //         emit(const ImageState(isLoading: false));
    //       }
    //     },
    //   );
  }
}
