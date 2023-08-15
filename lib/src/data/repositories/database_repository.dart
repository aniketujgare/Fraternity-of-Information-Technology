import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import '../../domain/models/event_model.dart';
import '../../domain/models/event_winners_model.dart';
import '../../domain/models/fit_committee.dart';
import '../../domain/models/honour_board_model.dart';
import '../../domain/models/user_model.dart';

class DatabaseRepository {
  var uuid = const Uuid();

  final _collection = FirebaseFirestore.instance.collection('users');
  final winnersCollection =
      FirebaseFirestore.instance.collection('event_winners');
  final _fitCommittee = FirebaseFirestore.instance.collection('fit_committee');
  final _honourBoardCollection =
      FirebaseFirestore.instance.collection('honour_board');
  final user = FirebaseAuth.instance.currentUser;
  Future<UserModel> getUser() async {
    final snapshot = await _collection.doc(user!.uid).get();
    return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> addUser(UserModel user) async {
    await _collection.doc(user.userId).set(user.toJson());
  }

  Future<UserModel> updateUser(UserModel userModel) async {
    await _collection.doc(user!.uid).update(userModel.toJson());
    return userModel;
  }

  Future<void> deleteUser(UserModel user) async {
    await _collection.doc(user.userId).delete();
  }

  Future<bool> checkUserExists() async {
    final snapshot = await _collection.doc(user!.uid).get();
    return snapshot.exists;
  }

  Future<String?> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, maxHeight: 500);

    if (pickedImage == null) return null;

    File imageFile = File(pickedImage.path);

    // Create a unique filename for the image
    String fileName = path.basename(imageFile.path);
    var randId = uuid.v1();
    String firebasePath = 'profile_pictures/$fileName-$randId';

    // Get a reference to the Firebase storage location
    Reference ref = FirebaseStorage.instance.ref().child(firebasePath);

    // Upload the file to Firebase storage
    TaskSnapshot uploadTask = await ref.putFile(imageFile);
    // UploadTask uploadTask = storageReference.putFile(mFileImage);

    // Get the download URL of the uploaded image
    String downloadURL = await uploadTask.ref.getDownloadURL();

    return downloadURL;
  }

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return null;

    File imageFile = File(pickedImage.path);

    return imageFile;
  }

  Future<String?> uploadImage({required File imageFile}) async {
    // Create a unique filename for the image
    // String fileName = path.basename(imageFile.path);
    String firebasePath = 'images/fileName ${DateTime.now()}';

    // Get a reference to the Firebase storage location
    Reference ref = FirebaseStorage.instance.ref().child(firebasePath);

    // Upload the file to Firebase storage
    TaskSnapshot uploadTask = await ref.putFile(imageFile);
    // UploadTask uploadTask = storageReference.putFile(mFileImage);

    // Get the download URL of the uploaded image
    String downloadURL = await uploadTask.ref.getDownloadURL();

    return downloadURL;
  }

  Future<List<EventWinnersModel>> getAllWinners() async {
    final winnersCollection = FirebaseFirestore.instance
        .collection('event_winners')
        .orderBy("event_date", descending: true);

    final QuerySnapshot snapshot = await winnersCollection.get();

    return snapshot.docs.map((doc) {
      return EventWinnersModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<EventModel>> getAllPastEvents() async {
    final allEventsCollection = FirebaseFirestore.instance
        .collection('all_events')
        .orderBy("event_date", descending: true);

    final QuerySnapshot snapshot = await allEventsCollection.get();

    return snapshot.docs.map((doc) {
      return EventModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<EventWinnersModel> getARandomWinner() async {
    final int lengthOfDocs = (await winnersCollection.count().get()).count;
    final int randomIndex = Random().nextInt(min(10, lengthOfDocs));
    // var randomIndex = await winnersCollection.limit(1).get();
    final QuerySnapshot snapshot =
        await winnersCollection.limit(min(10, lengthOfDocs)).get();
    debugPrint(snapshot.docs[randomIndex].data().toString());
    return EventWinnersModel.fromJson(
        snapshot.docs[randomIndex].data() as Map<String, dynamic>);
  }

  Future<List<FitCommitteeModel>> getFitCommittee() async {
    final QuerySnapshot fitCommittee = await _fitCommittee.get();

    return fitCommittee.docs.map((doc) {
      return FitCommitteeModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<EventModel>?> getUpcomingEvents() async {
    final collectionInstance = FirebaseFirestore.instance
        .collection('upcoming_events')
        .orderBy("event_date", descending: true);

    final QuerySnapshot upcomingEvents = await collectionInstance.get();
    try {
      return upcomingEvents.docs.map((doc) {
        return EventModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<HonourBoardModel>> getHonourBoard() async {
    final QuerySnapshot snapshot = await _honourBoardCollection.get();

    return snapshot.docs.map((doc) {
      return HonourBoardModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
