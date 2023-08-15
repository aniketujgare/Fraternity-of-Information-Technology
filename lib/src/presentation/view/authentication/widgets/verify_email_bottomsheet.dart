import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/constants.dart';
import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';

class VerifyEmailBottomSheet extends StatefulWidget {
  const VerifyEmailBottomSheet({super.key});

  @override
  State<VerifyEmailBottomSheet> createState() => _VerifyEmailBottomSheet();
}

class _VerifyEmailBottomSheet extends State<VerifyEmailBottomSheet> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: kHeight(context) * 0.5,
      width: kWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 40,
              left: 25,
              right: kWidth(context) * 0.35,
              bottom: 15,
            ),
            child: const FittedBox(
              child: Text(
                'Verify \nyour Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 25,
              left: 25,
              right: kWidth(context) * 0.35,
            ),
            child: const FittedBox(
              child: Text(
                'We have sent you a Email on:',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25,
              right: kWidth(context) * 0.35,
            ),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is VerifyEmail) {
                  return Text(
                    state.email,
                    style: const TextStyle(
                      color: kPrimaryColor,
                    ),
                  );
                }
                return const Text(
                  'Your Provided email',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: kHeight(context) * 0.05),
          const FITCircularLoadingIndicator(),
        ],
      ),
    );
  }
}
