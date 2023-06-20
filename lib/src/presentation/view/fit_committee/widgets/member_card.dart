import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/constants.dart';
import 'social_link_button.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    super.key,
    required this.position,
    required this.profilePic,
    required this.branch,
    required this.name,
    required this.year,
  });

  final String profilePic;
  final String position;
  final String name;
  final String year;
  final String branch;

  @override
  Widget build(BuildContext context) {
    final Uri whatsapp =
        Uri.parse('whatsapp://send?phone=918888190935&text=Hey!');

    final Uri linkedin = Uri.parse('https://linkedin.com/m/tejasbadone');

    final Uri instagram = Uri.parse('https://www.instagram.com/aniketujgare/');

    final Uri phoneNumber = Uri.parse('tel: +918888190935');

    final Uri email = Uri.parse('mailto:tejas.badone25@gmail.com');

    return Container(
      margin: const EdgeInsets.all(8),
      height: 150,
      width: 350,
      decoration: const BoxDecoration(
        color: kGrayCardColor,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      profilePic,
                    ),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    position,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        color: kTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    year,
                    style: const TextStyle(
                        color: kTextFieldContentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    branch,
                    style: const TextStyle(
                        color: kTextFieldContentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      SocialLinkButton(
                        icon: 'phone_icon.svg',
                        onTap: () async {
                          await launchUrl(phoneNumber);
                        },
                      ),
                      SocialLinkButton(
                        icon: 'whatsapp_icon.svg',
                        onTap: () async {
                          await launchUrl(whatsapp);
                        },
                      ),
                      SocialLinkButton(
                        icon: 'linkedin_icon.svg',
                        onTap: () async {
                          await launchUrl(linkedin);
                        },
                      ),
                      SocialLinkButton(
                        icon: 'instagram_icon.svg',
                        onTap: () async {
                          await launchUrl(
                            instagram,
                          );
                        },
                      ),
                      SocialLinkButton(
                        icon: 'email_icon.svg',
                        onTap: () async {
                          await launchUrl(email);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
