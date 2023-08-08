import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:fraternity_of_information_technology/src/presentation/blocs/auth/bloc/email_auth_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/authentication/widgets/signup_bottom_sheet.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/authentication/widgets/verify_email_bottomsheet.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/authentication/your_all_set_view.dart';
import 'package:go_router/go_router.dart';
import '../../../config/router/app_router_constants.dart';
import 'widgets/login_bottomsheet.dart';

import '../../../utils/constants/constants.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kScaffoldColor,
      ),
      child: Scaffold(
        bottomSheet: BlocConsumer<EmailAuthBloc, EmailAuthState>(
          listener: (context, state) {
            // If Phone Otp Verified. Send User to Home Screen

            if (state is UserLoggedIn) {
              context.goNamed(AppRoutConstants.fitUiNavigator.name);
            }
            // Show error message if any error occurs while verifying phone number and otp code
            if (state is EmailAuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, authState) {
            if (authState is VerifyEmail) {
              return const VerifyEmailBottomSheet();
            }
            if (authState is SignUpBottomSheetState) {
              return const SignUpBottomSheet();
            }
            if (authState is YouRAllSetState) {
              return const YourAllSetview();
            }
            if (authState is LoginBottomSheetState) {
              return const LoginBottomSheet();
            }
            return const LoginBottomSheet();
          },
        ),
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
