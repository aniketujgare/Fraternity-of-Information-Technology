import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import '../../domain/models/event_model.dart';
import '../../domain/models/event_winners_model.dart';
import '../../domain/models/extras_model.dart';
import '../../domain/models/fit_committee_model.dart';
import '../../domain/models/gallery_model.dart';
import '../../domain/models/honour_board_model.dart';
import '../../domain/models/news_model.dart';
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
    await _collection.doc(user!.uid).set(
        userModel.toJson(),
        SetOptions(mergeFields: [
          'name',
          'phone',
          'prn_number',
          'admission_year',
          'branch',
          'year'
        ]));
    return userModel;
  }

  Future<UserModel> updateImgeUrl(UserModel userModel) async {
    await _collection
        .doc(user!.uid)
        .set(userModel.toJson(), SetOptions(mergeFields: ['profile_pic']));
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
        .collection('past_events')
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

  Future<List<FITCommitteeModel>> getFitCommittee() async {
    final QuerySnapshot fitCommittee =
        await _fitCommittee.orderBy("active_year", descending: true).get();

    return fitCommittee.docs.map((doc) {
      return FITCommitteeModel.fromJson(doc.data() as Map<String, dynamic>);
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

  Future<List<NewsModel>> fetchNewsData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('news')
        .orderBy('news_date',
            descending: true) // Order by news_date in descending order
        .get();
    return querySnapshot.docs.map((doc) {
      return NewsModel.fromJson(doc.data());
    }).toList();
  }

  Future<List<GalleryModel>> fetchGalleryData() async {
    // Fetch data from Firestore collection
    final querySnapshot = await FirebaseFirestore.instance
        .collection('gallery')
        .orderBy('date', descending: true)
        .get();
    return querySnapshot.docs.map((doc) {
      return GalleryModel.fromJson(doc.data());
    }).toList();
    // Optionally yield an error state
  }

  Future<void> uploadImagesToFirebase(List<XFile> images, String date) async {
    String matchDate =
        DateFormat('MMM yyyy').format(DateTime.parse(date)).toUpperCase();
    try {
      final storage = FirebaseStorage.instance;
      final firestore = FirebaseFirestore.instance;
      var id = uuid.v1();
      List<String> downloadUrls = [];

      for (XFile image in images) {
        File file = File(image.path);
        String imageName =
            '${FirebaseAuth.instance.currentUser?.email ?? DateTime.now().millisecondsSinceEpoch}_${id}_${file.path.split('/').last}';
        Reference ref = storage.ref().child('gallery_images/$imageName');

        UploadTask uploadTask = ref.putFile(file);
        TaskSnapshot snapshot = await uploadTask;

        if (snapshot.state == TaskState.success) {
          String downloadUrl = await ref.getDownloadURL();
          downloadUrls.add(downloadUrl);
        }
      }

      final CollectionReference galleryCollection =
          firestore.collection('gallery');

      // Query the document using the date field
      final QuerySnapshot querySnapshot =
          await galleryCollection.where('key_date', isEqualTo: matchDate).get();

      if (querySnapshot.docs.isEmpty) {
        // Create a new document if it doesn't exist
        await galleryCollection.add({
          'date': date,
          'images': downloadUrls,
          'key_date': matchDate,
        });
      } else {
        // Retrieve the document reference
        final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

        // Retrieve the existing images array
        List<String> existingImages =
            List<String>.from(documentSnapshot['images']);

        // Append new images to the existing array
        existingImages.addAll(downloadUrls);

        // Update the document with the modified images array
        await galleryCollection
            .doc(documentSnapshot.id)
            .update({'images': existingImages});
      }

      debugPrint('Images uploaded and links stored successfully.');
    } catch (error) {
      debugPrint('Error uploading images and storing links: $error');
    }
  }

  Future<ExtrasModel?> getExtras() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('extras')
          .doc('downloadables') // Replace with your collection name
          .get();

      return ExtrasModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      debugPrint('Error fetching data: $e');
      return null;
    }
  }
}
