import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/update_account_bloc/update_account_bloc.dart';
import '../../widgets/fit_button.dart';
import 'widgets/agreement_text.dart';
import 'widgets/fit_back_button.dart';
import 'widgets/fit_dropdown_menu.dart';
import 'widgets/fit_textform_field.dart';

class UpdateAccountView extends StatelessWidget {
  const UpdateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const FitBackButton(),
                const Text(
                  'Update account',
                  style: TextStyle(fontSize: 36),
                ),
                const FitTextFormField(
                  label: 'First Name',
                  icon: Icons.person_outline,
                  topPad: 70,
                ),
                const FitTextFormField(
                  label: 'Last Name',
                  icon: Icons.person_outline,
                  topPad: 25,
                ),
                const FitTextFormField(
                  label: 'Email',
                  icon: Icons.alternate_email,
                  topPad: 25,
                ),
                const FitTextFormField(
                  label: 'PRN',
                  icon: Icons.format_indent_decrease,
                  topPad: 25,
                  botPad: 25,
                ),
                Row(
                  children: [
                    const Spacer(),
                    BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                      builder: (context, state) {
                        return FitDropDownMenu(
                          label: 'Branch',
                          icon: Icons.book_outlined,
                          items: state.branhItems,
                        );
                      },
                    ),
                    const Spacer(),
                    BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                      builder: (context, state) {
                        return FitDropDownMenu(
                            label: 'Year',
                            icon: Icons.calendar_month_rounded,
                            items: state.yearItems);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                FitButton(
                  onTap: () {},
                  text: 'Save',
                  height: 55,
                  tMargin: 65,
                  bMargin: 55,
                  showArrow: false,
                ),
                const AgreementText(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
