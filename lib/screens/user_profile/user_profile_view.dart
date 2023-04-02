import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/fit_button.dart';
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
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profile',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 36,
                          color: kTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: kPrimaryColor,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: kPrimaryColor),
                          shape: BoxShape.circle,
                          color: kPrimaryColor),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(
                            Icons.person,
                            size: 90,
                            color: kPrimaryColor,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const ProfileCard(
                    title: 'Full Name',
                    iconName: Icons.person,
                    titleValue: 'Mihir Madarchod'),
                const ProfileCard(
                    title: 'Phone Number',
                    iconName: Icons.call,
                    titleValue: '8888190935'),
                const ProfileCard(
                    title: 'Email',
                    iconName: Icons.alternate_email,
                    titleValue: 'mihir.mc@gmail.com'),
                const ProfileCard(
                    title: 'PRN Number',
                    iconName: Icons.badge,
                    titleValue: '201936585554'),
                const ProfileCard(
                    title: 'Branch',
                    iconName: Icons.school,
                    titleValue: 'Information Technology'),
                const ProfileCard(
                    title: 'Year',
                    iconName: Icons.school,
                    titleValue: 'Final Year'),
                const SizedBox(
                  height: 30,
                ),
                FitButton(
                  bgColor: kPrimaryColor,
                  height: 50,
                  text: 'Sign out',
                  showArrow: false,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                FitButton(
                  bgColor: kPrimaryColor,
                  height: 50,
                  text: 'Reset password',
                  showArrow: false,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    )));
  }
}
