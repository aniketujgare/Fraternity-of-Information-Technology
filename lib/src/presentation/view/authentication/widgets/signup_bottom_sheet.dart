import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/constants.dart';
import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../widgets/fit_button.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';
import '../../../widgets/textf_form_field_fit.dart';

class SignUpBottomSheet extends StatefulWidget {
  const SignUpBottomSheet({super.key});

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: kHeight(context) * 0.52,
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
              top: 30,
              left: 25,
              right: kWidth(context) * 0.18,
              bottom: 5,
            ),
            child: const FittedBox(
              child: Text(
                'Register\ncreate your account',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 15,
            ),
            child: TextFormFieldFit(
              hintText: 'Email',
              controller: emailController,
              icon: Icons.alternate_email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 5),
            child: TextFormFieldFit(
              hintText: 'Password',
              controller: passwordController,
              icon: Icons.password,
              hideText: true,
            ),
            // TextFormField(controller: phoneNoController),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(37, 0, 37, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Already have an account?'),
                GestureDetector(
                  child: const Text(
                    '\t\tLogin',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  onTap: () => context.read<AuthBloc>().add(
                      const AuthToggleFormEvent(formType: AuthFormType.signIn)),
                ),
              ],
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is EmailAuthLoading) {
                return const FITCircularLoadingIndicator();
              }
              return FitButton(
                onTap: () async {
                  context.read<AuthBloc>().add(EmailSignUpEvent(
                        userEmail: emailController.text,
                        password: passwordController.text,
                      ));
                },
                text: 'Register',
                height: 55,
                tMargin: 20,
                hMargin: 35,
                showArrow: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
