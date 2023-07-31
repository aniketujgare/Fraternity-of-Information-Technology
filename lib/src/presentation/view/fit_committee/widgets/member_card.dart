import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/constants.dart';
import 'social_link_button.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    super.key,
    required this.branch,
    required this.email,
    required this.instagram,
    required this.linkedin,
    required this.name,
    required this.phoneNumber,
    required this.position,
    required this.profilePic,
    required this.year,
  });

  final String branch;
  final String email;
  final String instagram;
  final String linkedin;
  final String name;
  final String phoneNumber;
  final String position;
  final String profilePic;
  final String year;

  @override
  Widget build(BuildContext context) {
    final Uri _whatsapp =
        Uri.parse('whatsapp://send?phone=$phoneNumber&text=Hey!');

    final Uri _linkedin = Uri.parse(linkedin);

    final Uri _instagram = Uri.parse(instagram);

    final Uri _phoneNumber = Uri.parse('tel: +91$phoneNumber');

    final Uri _email = Uri.parse('mailto:$email');

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
                          try {
                            await launchUrl(_phoneNumber);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Dialer is not installed!')));
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'whatsapp_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(_whatsapp);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Whatsapp is not installed!')));
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'linkedin_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(_linkedin);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('LinkedIn is not installed!')));
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'instagram_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(
                              _instagram,
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Instagram is not installed!')));
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'email_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(_email);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('G-Mail is not installed!')));
                          }
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
