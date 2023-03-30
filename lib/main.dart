import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/constants.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/update_account_bloc/update_account_bloc.dart';
import 'widgets/login_bottomsheet.dart';
import 'widgets/otp_bottomsheet.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FIT',
      theme: ThemeData(
        fontFamily: 'Outfit',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
        ),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(),
          ),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
      ),
      child: Scaffold(
        bottomSheet: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            return current is! LoadingAuthState;
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case AuthSucessState:
                return const OtpBottomSheet();
              default:
                return const LoginBottomSheet();
            }
          },
        ),
        body: SafeArea(
          child: Container(
            // height: kHeight(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [kPrimaryColor, kSecondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.55],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: (kHeight(context) * 0.1) + 5,
                  child: Image.asset(
                    'assets/images/FIT_logo.png',
                    fit: BoxFit.cover,
                    color: Colors.black.withAlpha(25),
                  ),
                ),
                Positioned(
                  top: (kHeight(context) * 0.1),
                  child: Image.asset(
                    'assets/images/FIT_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
