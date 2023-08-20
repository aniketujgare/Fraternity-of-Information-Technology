import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/presentation/widgets/fit_circular_loading_indicator.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/user_model.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/date_picker_cubit/date_picker_cubit.dart';
import '../../blocs/update_account_bloc/update_account_bloc.dart';
import '../../widgets/fit_button.dart';
import 'widgets/agreement_text.dart';
import 'widgets/fit_back_button.dart';
import 'widgets/fit_dropdown_menu.dart';
import 'widgets/fit_textform_field.dart';

String selectedDate = '';

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
    nameController.text = widget.userModel.name ?? '';
    phoneController.text = widget.userModel.phone ?? '';
    emailController.text = widget.userModel.email ?? '';
    prnController.text = widget.userModel.prnNumber ?? '';
    branchController.text = widget.userModel.branch ?? 'null';
    yearController.text = widget.userModel.year ?? 'null';
    admissionYearController.text = widget.userModel.admissionYear ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Call this in the select year button.

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
                  keyboardType: TextInputType.name,
                  textFieldController: nameController,
                ),
                // FitTextFormField(
                //   label: 'Email',
                //   icon: Icons.alternate_email,
                //   topPad: 25,
                //   keyboardType: TextInputType.emailAddress,
                //   textFieldController: emailController,
                // ),
                FitTextFormField(
                  label: 'Phone',
                  icon: Icons.phone,
                  topPad: 25,
                  keyboardType: TextInputType.phone,
                  textFieldController: phoneController,
                ),
                FitTextFormField(
                  label: 'PRN',
                  icon: Icons.format_list_numbered_rtl,
                  topPad: 25,
                  keyboardType: TextInputType.number,
                  textFieldController: prnController,
                ),
                dateField(context),
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
                          icon: Icons.badge,
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
                          name: nameController.text == ''
                              ? null
                              : nameController.text,
                          email: emailController.text == ''
                              ? null
                              : emailController.text,
                          branch: branchController.text == 'null'
                              ? null
                              : branchController.text,
                          phone: phoneController.text == ''
                              ? null
                              : phoneController.text,
                          prnNumber: prnController.text == ''
                              ? null
                              : prnController.text,
                          year: yearController.text == 'null'
                              ? null
                              : yearController.text,
                          admissionYear:
                              selectedDate == '' ? null : selectedDate,
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

Padding dateField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 58,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: const Color(0XFFF7F8F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: const Color(0XFFECEFF5),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Icon(Icons.calendar_month, color: Color(0XFFADB6C1)),
              const SizedBox(width: 12),
              BlocBuilder<DatePickerCubit, DatePickerState>(
                builder: (context, state) {
                  if (state is DateSelectedState) {
                    selectedDate = state.date;
                    return Text('${state.date} - Admission Year',
                        style: const TextStyle(
                          fontSize: 16,
                        ));
                  }
                  return const Text('Admission Year',
                      style: TextStyle(
                        color: Color(0XFFADB6C1),
                        fontSize: 16,
                      ));
                },
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () =>
              context.read<DatePickerCubit>().pickYear(context: context),
          icon: const CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 23,
            child: Icon(
              Icons.calendar_month_rounded,
              color: Colors.white,
            ),
          ),
          splashRadius: 25,
          iconSize: 35,
          highlightColor: kPrimaryColor.withOpacity(0.3),
          splashColor: kPrimaryColor.withOpacity(0.3),
        ),
      ],
    ),
  );
}
