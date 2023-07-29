import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fraternity_of_information_technology/src/domain/models/user_model.dart';
import 'dart:io';

class DatabaseRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('users');
  final user = FirebaseAuth.instance.currentUser;
  Future<UserModel> getUser() async {
    final snapshot = await _collection.doc(user!.uid).get();
    return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> addUser(UserModel user) async {
    await _collection.doc(user.docID).set(user.toJson());
  }

  Future<UserModel> updateUser(UserModel userModel) async {
    await _collection.doc(user!.uid).update(userModel.toJson());
    return userModel;
  }

  Future<void> deleteUser(UserModel user) async {
    await _collection.doc(user.docID).delete();
  }

  Future<bool> checkUserExists() async {
    final snapshot = await _collection.doc(user!.uid).get();
    return snapshot.exists;
  }

  //  Future<UserModel> uploadProfilePic(String path, UserModel userModel) async {
  //   File result = await storage.createFile(
  //     bucketId: '6484f3557588980fdc8b',
  //     fileId: ID.unique(),
  //     file: InputFile.fromPath(path: path, filename: ID.unique()),
  //   );
  //   // 64874f8ec305c472a1f6
  //   String url1 =
  //       'https://cloud.appwrite.io/v1/storage/buckets/6484f3557588980fdc8b/files/';
  //   String url2 = result.$id;
  //   String url3 = '/view?project=64690d0eedba385967a1&mode=admin';
  //   userModel.profilePic = url1 + url2 + url3;
  //   return updateUserProfile(userModel: userModel);
  // }
  Future<String?> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return null;

    File imageFile = File(pickedImage.path);

    // Create a unique filename for the image
    String fileName = path.basename(imageFile.path);
    String firebasePath = 'images/$fileName';

    // Get a reference to the Firebase storage location
    Reference ref = FirebaseStorage.instance.ref().child(firebasePath);

    // Upload the file to Firebase storage
    TaskSnapshot uploadTask = await ref.putFile(imageFile);

    // Get the download URL of the uploaded image
    String downloadURL = await uploadTask.ref.getDownloadURL();

    return downloadURL;
  }
}
