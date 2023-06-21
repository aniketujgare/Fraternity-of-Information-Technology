import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'widgets/login_bottomsheet.dart';

import '../../../utils/constants/constants.dart';
import '../../blocs/app_navigator_cubit/app_navigator_cubit.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import 'widgets/otp_bottomsheet.dart';
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
        bottomSheet: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            if (authState is AuthSucessState) {
              return BlocProvider(
                create: (context) => AppNavigatorCubit(),
                child: const YourAllSetview(),
              );
            } else if (authState is UnAuthState) {
              return const LoginBottomSheet();
            } else if (authState is SendOTPState) {
              return const OtpBottomSheet();
            }
            // else if (authState is CreateAccountPageState) {
            //   return const CreateAccountPage();
            // } else if (authState is ErrorPageState) {
            //   return const ErrorPage();
            // }
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
