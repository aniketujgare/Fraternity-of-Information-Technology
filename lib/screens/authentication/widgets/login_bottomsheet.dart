import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/widgets/fit_button.dart';
import 'package:fraternity_of_information_technology/widgets/textf_form_field_fit.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../../utils/constants.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

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
              top: 40,
              left: 25,
              right: kWidth(context) * 0.35,
              bottom: 25,
            ),
            child: const FittedBox(
              child: Text(
                'Log in\nto your account',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 25,
            ),
            child: TextFormFieldFit(
              hintText: 'Phone number',
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoadingAuthState) {
                return const Center(child: CircularProgressIndicator());
              }
              return FitButton(
                onTap: () {
                  context.read<AuthBloc>().add(SendOTP());
                },
                text: 'Login',
                height: 50,
                tMargin: 20,
                hMargin: 35,
              );
            },
          ),
        ],
      ),
    );
  }
}
