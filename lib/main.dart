import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fraternity_of_information_technology/src/domain/models/event_winners_model.dart';

import 'firebase_options.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/color_schemes.g.dart';
import 'src/data/datasources/firebase_api.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
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
    //     .collection('all_events')
    //     .get()
    //     .then((value) => print(value.docs.first.data()));
    // FirebaseFirestore.instance
    //     .collection('event_winners')
    //     .add(EventWinnersModel(
    //       date: '02/07/2023',
    //       eventName: 'Guess What Puzzle',
    //       organizer: 'Mihir',
    //       winners: [
    //         Winner(department: 'EXTC', name: 'Issa', year: 'Second Year'),
    //         Winner(department: 'Chemical', name: 'Wes', year: 'Third Year'),
    //         Winner(department: 'IT', name: 'Kiara', year: 'Second Year'),
    //       ],
    //     ).toJson());
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
