import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fraternity_of_information_technology/src/domain/models/event_model.dart';
import 'package:fraternity_of_information_technology/src/domain/models/event_winners_model.dart';

import 'firebase_options.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/color_schemes.g.dart';
import 'src/data/datasources/firebase_api.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
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
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: darkColorScheme,
      //   fontFamily: 'Outfit',
      // ),
    );
  }
}
