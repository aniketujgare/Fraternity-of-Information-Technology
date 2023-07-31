import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/widgets/fit_circular_loading_indicator.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/user_model.dart';
import '../../blocs/update_account_bloc/update_account_bloc.dart';
import '../../widgets/fit_button.dart';
import 'widgets/agreement_text.dart';
import 'widgets/fit_back_button.dart';
import 'widgets/fit_dropdown_menu.dart';
import 'widgets/fit_textform_field.dart';

class UpdateAccountView extends StatefulWidget {
  final UserModel userModel;
  const UpdateAccountView({super.key, required this.userModel});

  @override
  State<UpdateAccountView> createState() => _UpdateAccountViewState();
}

class _UpdateAccountViewState extends State<UpdateAccountView> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var prnController = TextEditingController();
  var branchController = TextEditingController();
  var yearController = TextEditingController();
  var admissionYearController = TextEditingController();
  @override
  void initState() {
    nameController.text = widget.userModel.name ?? 'Full Name';
    phoneController.text = widget.userModel.phone ?? 'Phone Number';
    emailController.text = widget.userModel.email ?? 'example@email.com';
    prnController.text = widget.userModel.prnNumber ?? 'PRN Number';
    branchController.text = widget.userModel.branch ?? 'null';
    yearController.text = widget.userModel.year ?? 'null';
    admissionYearController.text =
        widget.userModel.admissionYear ?? 'Admission Year';
    super.initState();
  }

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
                FitTextFormField(
                  label: 'Full Name',
                  icon: Icons.person_outline,
                  topPad: 70,
                  textFieldController: nameController,
                ),
                FitTextFormField(
                  label: 'Email',
                  icon: Icons.alternate_email,
                  topPad: 25,
                  textFieldController: emailController,
                ),
                FitTextFormField(
                  label: 'PRN',
                  icon: Icons.format_indent_decrease,
                  topPad: 25,
                  botPad: 25,
                  textFieldController: prnController,
                ),
                FitTextFormField(
                  label: 'Admission Year',
                  icon: Icons.onetwothree,
                  botPad: 25,
                  textFieldController: admissionYearController,
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
                          selectedValue: branchController,
                        );
                      },
                    ),
                    const Spacer(),
                    BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                      builder: (context, state) {
                        return FitDropDownMenu(
                          label: 'Year',
                          icon: Icons.calendar_month_rounded,
                          items: state.yearItems,
                          selectedValue: yearController,
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                BlocConsumer<UpdateAccountBloc, UpdateAccountState>(
                  listener: (context, state) {
                    if (state is UpdatedSuccesFully) {
                      context.pop();
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdateAccountLoading) {
                      return const SizedBox(
                          height: 185, child: FITCircularLoadingIndicator());
                    }
                    return FitButton(
                      onTap: () {
                        var updatedUserModel = widget.userModel.copyWith(
                          name: nameController.text == 'Full Name'
                              ? null
                              : nameController.text,
                          email: emailController.text == 'example@email.com'
                              ? null
                              : emailController.text,
                          branch: branchController.text == 'null'
                              ? null
                              : branchController.text,
                          phone: phoneController.text == 'Phone Number'
                              ? null
                              : phoneController.text,
                          prnNumber: prnController.text == 'PRN Number'
                              ? null
                              : prnController.text,
                          year: yearController.text == 'null'
                              ? null
                              : yearController.text,
                          admissionYear:
                              admissionYearController.text == 'Admission Year'
                                  ? null
                                  : admissionYearController.text,
                        );
                        context
                            .read<UpdateAccountBloc>()
                            .add(UpdateUserEvent(userModel: updatedUserModel));
                      },
                      text: 'Save',
                      height: 55,
                      tMargin: 65,
                      bMargin: 55,
                      showArrow: false,
                    );
                  },
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
