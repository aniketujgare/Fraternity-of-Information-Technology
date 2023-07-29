import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:fraternity_of_information_technology/src/config/router/app_router_constants.dart';
import 'package:go_router/go_router.dart';
import 'widgets/login_bottomsheet.dart';

import '../../../utils/constants/constants.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import 'widgets/otp_bottomsheet.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kScaffoldColor,
      ),
      child: Scaffold(
        bottomSheet:
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          // If Phone Otp Verified. Send User to Home Screen

          if (state is PhoneAuthVerified) {
            context.goNamed(AppRoutConstants.fitUiNavigator.name);
          }
          // Show error message if any error occurs while verifying phone number and otp code
          if (state is PhoneAuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        }, builder: (context, authState) {
          if (authState is PhoneAuthCodeSentSuccess) {
            return const OtpBottomSheet();
          }
          return const LoginBottomSheet();
        }),
        body: SafeArea(
          child: Container(
            // height: kHeight(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [kScaffoldColor, kSecondaryColor],
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
                  top: (kHeight(context) * 0.08) + 5,
                  child: SizedBox(
                    width: kWidth(context) - 56,
                    child: Image.asset(
                      'assets/images/FIT_logo.png',
                      fit: BoxFit.contain,
                      color: Colors.black.withAlpha(25),
                    ),
                  ),
                ),
                Positioned(
                  top: (kHeight(context) * 0.08),
                  child: SizedBox(
                    width: kWidth(context) - 56,
                    child: Image.asset(
                      'assets/images/FIT_logo.png',
                      fit: BoxFit.contain,
                    ),
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
