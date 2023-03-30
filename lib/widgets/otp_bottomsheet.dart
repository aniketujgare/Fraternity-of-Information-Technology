import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/bloc/update_account_bloc/update_account_bloc.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../constants.dart';
import '../screens/update_account/update_account_view.dart';
import 'fit_button.dart';
import 'otp_tharasis.dart';

class OtpBottomSheet extends StatelessWidget {
  const OtpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: kHeight(context) * 0.45,
      width: kWidth(context),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 35,
              left: kWidth(context) * 0.2,
              right: kWidth(context) * 0.2,
              bottom: 15,
            ),
            child: const FittedBox(
              child: Text(
                'OTP Verification',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: kWidth(context) * 0.1,
              right: kWidth(context) * 0.1,
            ),
            child: const FittedBox(
              child: Text(
                'Enter the verification code we’ve just sent to the \n+91 8888190935',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xffb6bbc8),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 35,
                left: kWidth(context) * 0.1,
                right: kWidth(context) * 0.1,
                bottom: 20,
              ),
              child: const OtpTharasis()),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoadingAuthState) {
                return const Center(child: CircularProgressIndicator());
              }
              return FitButton(
                onTap: () {
                  context.read<AuthBloc>().add(VerifyOTP());
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BlocProvider<UpdateAccountBloc>(
                        create: (_) => UpdateAccountBloc(),
                        child: const UpdateAccountView());
                  }));
                },
                text: 'Verify',
                height: 50,
                tMargin: 20,
                hMargin: 35,
                showArrow: false,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: kWidth(context) * 0.1,
              right: kWidth(context) * 0.1,
              // bottom: 20,
            ),
            child: const Text(
              'Resend code in 00:45',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xffb6bbc8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
