import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' show debugPrint;
import '../../domain/models/all_event_model.dart';
import '../../domain/models/event_registration_model.dart';
import '../../domain/models/fit_committee.dart';
import '../../domain/models/honour_board_model.dart';
import '../../domain/models/upcoming_event_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/models/user_model.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';

import '../../domain/models/event_winners_model.dart';

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

    // Create a unique filename for the image
    // String fileName = path.basename(imageFile.path);
    // String firebasePath = 'images/${DateTime.now()}';

    // // Get a reference to the Firebase storage location
    // Reference ref = FirebaseStorage.instance.ref().child(firebasePath);

    // // Upload the file to Firebase storage
    // TaskSnapshot uploadTask = await ref.putFile(imageFile);
    // // UploadTask uploadTask = storageReference.putFile(mFileImage);

    // // Get the download URL of the uploaded image
    // String downloadURL = await uploadTask.ref.getDownloadURL();

    return imageFile;
  }

  Future<String?> uploadImage({required File imageFile}) async {
    // final picker = ImagePicker();
    // final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    // if (pickedImage == null) return null;

    // File imageFile = File(pickedImage.path);

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
    final QuerySnapshot snapshot = await winnersCollection.get();

    return snapshot.docs.map((doc) {
      return EventWinnersModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<AllEventModel>> getAllPastEvents() async {
    final allEventsCollection =
        FirebaseFirestore.instance.collection('all_events');
    final QuerySnapshot snapshot = await allEventsCollection.get();

    return snapshot.docs.map((doc) {
      return AllEventModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<EventWinnersModel> getARandomWinner() async {
    final int lengthOfDocs = (await winnersCollection.count().get()).count;
    final int randomIndex = Random().nextInt(min(10, lengthOfDocs));
    // var randomIndex = await winnersCollection.limit(1).get();
    final QuerySnapshot snapshot =
        await winnersCollection.limit(min(10, lengthOfDocs)).get();
    print(snapshot.docs[randomIndex].data().toString());
    return EventWinnersModel.fromJson(
        snapshot.docs[randomIndex].data() as Map<String, dynamic>);
  }

  Future<List<FitCommitteeModel>> getFitCommittee() async {
    final QuerySnapshot fitCommittee = await _fitCommittee.get();

    return fitCommittee.docs.map((doc) {
      return FitCommitteeModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<List<UpcomingEventModel>> getUpcomingEvents() async {
    final collectionInstance =
        FirebaseFirestore.instance.collection('upcoming_events');

    final QuerySnapshot upcomingEvents = await collectionInstance.get();

    return upcomingEvents.docs.map((doc) {
      return UpcomingEventModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<void> registerForEvent(UpcomingEventModel event) async {
    final registrationModel = EventRegistrationModel().copyWith(
      date: event.date,
      eventName: event.eventTitle,
      organizer: event.organizer!.first,
    );
    final user = await getUser();
    FirebaseFirestore.instance
        .collection('event_registrations')
        .doc(user.docID)
        .set(registrationModel.toJson());
  }

  Future<List<HonourBoardModel>> getHonourBoard() async {
    final QuerySnapshot snapshot = await _honourBoardCollection.get();

    return snapshot.docs.map((doc) {
      return HonourBoardModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<void> addUpcominEventToFirestore(UpcomingEventModel event) async {
    final CollectionReference eventsCollection =
        FirebaseFirestore.instance.collection('upcoming_events');
    try {
      var docId = uuid.v1();
      if (event.docId == null) {
        event = event.copyWith(docId: docId);
      }
      // print(updatedEvent.toString());
      await eventsCollection.doc(event.docId).set(event.toJson());
      debugPrint('Event added to Firestore');
    } catch (error) {
      debugPrint('Error adding event to Firestore: $error');
    }
  }
}
