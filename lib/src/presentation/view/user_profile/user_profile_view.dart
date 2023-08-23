import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/app_router_constants.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/update_account_bloc/update_account_bloc.dart';
import '../../widgets/fit_button.dart';
import '../../widgets/fit_circular_loading_indicator.dart';
import 'widgets/profile_card.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: kHeading1FontSize,
                    ),
                  ),
                  // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                        builder: (context, state) {
                          if (state is FetchUserState) {
                            return IconButton(
                                onPressed: () {
                                  SchedulerBinding.instance
                                      .addPostFrameCallback((_) {
                                    context.pushNamed(
                                        AppRoutConstants.updateAccount.name,
                                        extra: state.userModel);
                                  });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: kPrimaryColor,
                                ));
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      IconButton(
                          onPressed: () async {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              context
                                  .pushNamed(AppRoutConstants.aboutView.name);
                            });
                          },
                          icon: const Icon(
                            Icons.interests,
                            color: kPrimaryColor,
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4, color: const Color(0xffeceff5)),
                            shape: BoxShape.circle,
                            color: const Color(0xffF7F7F7)),
                        child: ClipOval(
                          child: BlocConsumer<UpdateAccountBloc,
                              UpdateAccountState>(
                            listener: (context, state) {
                              if (state is UpdateAccountError) {
                                kShowSnackBar(
                                    context, SnackType.error, state.error);
                              }
                            },
                            builder: (context, state) {
                              if (state is PickImageLoadingState) {
                                return const Center(
                                  child: FITCircularLoadingIndicator(
                                    topMargin: 0,
                                  ),
                                );
                              } else if (state is ImageUploadedState &&
                                  state.imageURL != null) {
                                context
                                    .read<UpdateAccountBloc>()
                                    .add(const FetchUserEvent());
                                return Image.network(
                                  state.imageURL!,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                if (state is FetchUserState &&
                                    state.userModel.profilePic != null) {
                                  return Image.network(
                                    state.userModel.profilePic!,
                                    fit: BoxFit.cover,
                                  );
                                }
                                return const Icon(
                                  Icons.person,
                                  size: 90,
                                  color: Colors.black,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: kWidth(context) * 0.5,
                        top: 108,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: const Color(0xffeceff5)),
                              shape: BoxShape.circle,
                              color: const Color(0xffF7F7F7)),
                          child: BlocBuilder<UpdateAccountBloc,
                              UpdateAccountState>(
                            builder: (context, state) {
                              if (state is FetchUserState) {
                                return GestureDetector(
                                  onTap: () {
                                    context.read<UpdateAccountBloc>().add(
                                        PickImageEvent(
                                            currImageUrl:
                                                state.userModel.profilePic ??
                                                    ''));
                                  },
                                  child: const Icon(Icons.edit,
                                      size: 20, color: kPrimaryColor),
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                    builder: (context, state) {
                      String name = '';
                      if (state is FetchUserState) {
                        name = state.userModel.name ?? name;
                      }
                      return ProfileCard(
                          title: 'Full Name',
                          iconName: Icons.person,
                          titleValue: name);
                    },
                  ),
                  BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                    builder: (context, state) {
                      String phone = '';
                      if (state is FetchUserState) {
                        phone = state.userModel.phone ?? phone;
                      }
                      return ProfileCard(
                          title: 'Phone Number',
                          iconName: Icons.call,
                          titleValue: phone);
                    },
                  ),
                  BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                    builder: (context, state) {
                      String email = '';
                      if (state is FetchUserState) {
                        email = state.userModel.email ?? email;
                      }
                      return ProfileCard(
                          title: 'Email',
                          iconName: Icons.alternate_email,
                          titleValue: email);
                    },
                  ),
                  BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                    builder: (context, state) {
                      String prnNumber = '';
                      if (state is FetchUserState) {
                        prnNumber = state.userModel.prnNumber ?? prnNumber;
                      }
                      return ProfileCard(
                          title: 'PRN Number',
                          iconName: Icons.format_list_numbered_rtl,
                          titleValue: prnNumber);
                    },
                  ),
                  BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                    builder: (context, state) {
                      String branch = '';
                      if (state is FetchUserState) {
                        branch = state.userModel.branch ?? branch;
                      }
                      return ProfileCard(
                          title: 'Branch',
                          iconName: Icons.book_outlined,
                          titleValue: branch);
                    },
                  ),
                  BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
                    builder: (context, state) {
                      String year = '';
                      if (state is FetchUserState) {
                        year = state.userModel.year ?? year;
                      }
                      return ProfileCard(
                          title: 'Year',
                          iconName: Icons.school,
                          titleValue: year);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is EmailAuthInitialState) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          context.replaceNamed(AppRoutConstants.authFlow.name);
                        });
                      }
                    },
                    child: FitButton(
                      bgColor: kPrimaryColor,
                      height: 50,
                      text: 'Sign out',
                      showArrow: false,
                      onTap: () async {
                        context.read<AuthBloc>().add(AuthSignOutEvent());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ])),
              )
            ],
          ),
        );
      },
    )));
  }
}
