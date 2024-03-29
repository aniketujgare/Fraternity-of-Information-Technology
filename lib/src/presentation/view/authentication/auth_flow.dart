import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/app_router_constants.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import 'widgets/login_bottomsheet.dart';
import 'widgets/signup_bottom_sheet.dart';
import 'widgets/verify_email_bottomsheet.dart';
import 'your_all_set_view.dart';

class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kScaffoldColor,
      ),
      child: Scaffold(
        bottomSheet: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // If Phone Otp Verified. Send User to Home Screen
            debugPrint(state.runtimeType.toString());
            if (state is UserLoggedIn) {
              context.goNamed(AppRoutConstants.fitUiNavigator.name);
            }
            // Show error message if any error occurs while verifying phone number and otp code
            if (state is EmailAuthError) {
              kShowSnackBar(context, SnackType.error, state.error);
            }
          },
          builder: (context, authState) {
            if (authState is VerifyEmail) {
              return const VerifyEmailBottomSheet();
            }

            if (authState is YouRAllSetState) {
              return YourAllSetview(text: authState.text);
            }
            if (authState is EmailAuthInitialState) {
              return authState.formType == AuthFormType.signIn
                  ? const LoginBottomSheet()
                  : const SignUpBottomSheet();
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
