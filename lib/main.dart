import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fraternity_of_information_technology/src/data/datasources/firebase_api.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import 'firebase_options.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/color_schemes.g.dart';

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
    //     .collection('upcoming_events')
    //     .get()
    //     .then((value) => print(value.docs.first.data()));
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
