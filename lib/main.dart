import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'src/domain/models/event_model.dart';
import 'src/domain/models/event_winners_model.dart';
import 'src/domain/models/fit_committee_model.dart';

import 'firebase_options.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/color_schemes.g.dart';
import 'src/data/datasources/firebase_api.dart';
import 'upload_to_db.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // UploadToDb().addUpcomingEvent();
    // FirebaseFirestore.instance
    //     .collection('honour_board')
    //     .get()
    //     .then((value) => print(value.docs.first.data()));
    // FirebaseFirestore.instance.collection('all_events').add(EventModel(
    //         eventTitle: 'Test Contest',
    //         eventDate: '2022-11-15',
    //         eventOrganizers: ['Mihir', 'rajat'],
    //         bannerImage:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/event_banners%2FDesign.png?alt=media&token=a48bbb30-c8a1-4654-95a3-849abac981ee',
    //         eventDescription:
    //             '🌟🔎 Competitive Programming Workshop: Unlock Your Coding Potential! 🔎🌟  \n\nJoin us for an immersive workshop where we\'ll guide you on the path to becoming a skilled competitive programmer. Discover the secrets to success, learn from common mistakes, and explore essential data structures.  \n\n📚 Date: 1 June 2023 \n⏰ Time: 1:30pm - 2:15pm \n🏢 Venue: LH - 203 \n➡ Entry : Free!!  \n\n🔎🌟 What to expect at the Competitive Programming Workshop: 🌟🔎  \n\n⿡ Mistakes to Avoid: Understand common pitfalls and mistakes made by aspiring competitive programmers. Learn from these experiences and save valuable time on your coding journey. \n⿢ Key Data Structures: Explore important data structures used in competitive programming, such as arrays, linked lists, stacks, queues, trees, and graphs. Understand their applications and how to leverage them effectively. \n⿣ Q&A and Discussion: Interact with our experienced instructors and clarify any doubts you may have. Engage in discussions with fellow participants to exchange ideas and expand your knowledge',
    //         eventId: 'aabra',
    //         eventImages: ['sdf', 'gfb'],
    //         eventType: EventType.contest,
    //         registrationUrl: 'sdf')
    //     .toJson());
    // FirebaseFirestore.instance.collection('fit_committee').doc('2022-2023').set(
    //     FITCommitteeModel(activeYear: '2022-2023', members: [
    //       Member(
    //         designation: 'President',
    //         instagram: 'https://www.instagram.com/aniket.ujgare/',
    //         linkedin: 'https://in.linkedin.com/in/aniket-ujgare-759666212',
    //         mail: 'aniketujgare@gmail.com',
    //         name: 'Aniket Ujgare',
    //         phone: '9175197037',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/downloadables%2Faniket_ujgare.png?alt=media&token=f99b1a93-3245-46b8-96eb-cb83cbd14d82',
    //       ),
    //       Member(
    //         designation: 'President',
    //         instagram: '',
    //         linkedin: 'https://in.linkedin.com/in/yash-bansod',
    //         mail: '',
    //         name: 'Yash Bansod',
    //         phone: '7038588451',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Fyash_bansod.png?alt=media&token=c272657f-9f84-4358-9a41-e0b50f302145',
    //       ),
    //       Member(
    //         designation: 'Vice President',
    //         instagram: '',
    //         linkedin: '',
    //         mail: '',
    //         name: 'Siddhi Satpute',
    //         phone: '9405788123',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Fsiddhi_satpute.png?alt=media&token=a00d9838-2215-4c3e-b96f-46fbc3ba9ac4',
    //       ),
    //       Member(
    //         designation: 'Treasurer',
    //         instagram: '',
    //         linkedin: 'https://www.linkedin.com/in/tushar-shinde-250ab51b1/',
    //         mail: '',
    //         name: 'Tushar Shinde',
    //         phone: '9405788123',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Ftushar_shinde.png?alt=media&token=d50d9505-9f17-4551-bebf-dafea1efa14a',
    //       ),
    //       Member(
    //         designation: 'LR',
    //         instagram: 'https://www.instagram.com/shonaa.___.01/',
    //         linkedin: 'https://www.linkedin.com/in/sonalishinde0153/',
    //         mail: '',
    //         name: 'Sonali Shinde',
    //         phone: '9145447937',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Fsonali_shinde.png?alt=media&token=edbfa3e8-130b-4e2e-87c7-ef0dcf5e5c35',
    //       ),
    //       Member(
    //         designation: 'Cultural Secretary',
    //         instagram: '',
    //         linkedin: '',
    //         mail: '',
    //         name: 'Rutuja Jadhav',
    //         phone: '7083182109',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Frutuja_jadhav.png?alt=media&token=8363c87a-aafd-4332-bc52-1f70c70701f8',
    //       ),
    //       Member(
    //         designation: 'Cultural Secretary',
    //         instagram: '',
    //         linkedin: '',
    //         mail: '',
    //         name: 'Ziya Shaikh',
    //         phone: '9028706779',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Fziya_shaikh.png?alt=media&token=2b7f6638-324b-4d6f-9d39-201d08680b43',
    //       ),
    //       Member(
    //         designation: 'Event Secretary',
    //         instagram: '',
    //         linkedin: '',
    //         mail: '',
    //         name: 'Shubhankit Bansod',
    //         phone: '9422834184',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Fshubhankit_basnod.png?alt=media&token=a7d81694-06e6-40eb-bf3f-92023e4e7328',
    //       ),
    //       Member(
    //         designation: 'Event Secretary',
    //         instagram: '',
    //         linkedin: '',
    //         mail: '',
    //         name: 'Sakshi Bhagat',
    //         phone: '7743962572',
    //         profilePic:
    //             'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/fit_committee%2F2022-2023%2Fsakshi_bhagat.png?alt=media&token=f6886e05-8584-4fd5-b07a-f5b0e8a7f695',
    //       ),
    //       Member(
    //         designation: 'Sports Secretary',
    //         instagram: '',
    //         linkedin: 'https://www.linkedin.com/in/indraneel-joshi-0823aa171/',
    //         mail: '',
    //         name: 'Indraneel Joshi',
    //         phone: '9284833521',
    //         profilePic: '',
    //       ),
    //       Member(
    //         designation: 'Technical Secretary',
    //         instagram: 'https://www.linkedin.com/in/amey-shinde-b565b8202/',
    //         linkedin: 'https://www.linkedin.com/in/indraneel-joshi-0823aa171/',
    //         mail: '',
    //         name: 'Amey Shinde',
    //         phone: '9421602701',
    //         profilePic: '',
    //       ),
    //     ]).toJson(),
    //     SetOptions(merge: true));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
      key: navigatorKey,
      title: 'FIT',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'Outfit',
      ),
    );
  }
}
