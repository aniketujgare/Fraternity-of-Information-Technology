import 'package:firebase_storage/firebase_storage.dart';
import 'package:fraternity_of_information_technology/src/domain/models/fit_committee.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fraternity_of_information_technology/src/domain/models/user_model.dart';
import 'dart:io';

import '../../domain/models/event_winners_model.dart';

class DatabaseRepository {
  final _collection = FirebaseFirestore.instance.collection('users');
  final winnersCollection =
      FirebaseFirestore.instance.collection('event_winners');
  final _fitCommittee = FirebaseFirestore.instance.collection('fit_committee');
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

  Future<List<EventWinnersModel>> getAllWinners() async {
    final QuerySnapshot snapshot = await winnersCollection.get();

    return snapshot.docs.map((doc) {
      return EventWinnersModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  getFitCommittee() async {
    final QuerySnapshot fitCommittee = await _fitCommittee.get();

    return fitCommittee.docs.map((doc) {
      return FitCommitteeModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
