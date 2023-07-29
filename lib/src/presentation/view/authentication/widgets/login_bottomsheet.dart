import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/constants.dart';
import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../widgets/fit_button.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';
import '../../../widgets/textf_form_field_fit.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  var phoneNoController = TextEditingController();
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
              bottom: 25,
            ),
            child: const FittedBox(
              child: Text(
                'Log in\nto your account',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 25,
            ),
            child: TextFormFieldFit(
                hintText: 'Phone No', controller: phoneNoController),
            // TextFormField(controller: phoneNoController),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const FITCircularLoadingIndicator();
              }
              return FitButton(
                onTap: () async {
                  context.read<AuthBloc>().add(
                      SendOtpToPhoneEvent(phoneNumber: phoneNoController.text));
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
