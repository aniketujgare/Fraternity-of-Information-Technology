import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/view/authentication/your_all_set_view.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import 'widgets/login_bottomsheet.dart';
import 'widgets/otp_bottomsheet.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: kScaffoldColor,
      ),
      child: Scaffold(
        bottomSheet: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            return current is! LoadingAuthState;
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case SendOTPState:
                return const OtpBottomSheet();
              case AuthSucessState:
                return const YourAllSetview();
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
