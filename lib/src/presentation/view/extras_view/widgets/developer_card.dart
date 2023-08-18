import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants/constants.dart';
import '../../fit_committee/widgets/social_link_button.dart';

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({
    super.key,
    required this.email,
    required this.instagram,
    required this.linkedin,
    required this.contribution,
    required this.phoneNumber,
    required this.name,
    this.profilePic,
    required this.description,
  });

  final String email;
  final String instagram;
  final String linkedin;
  final String contribution;
  final String phoneNumber;
  final String name;
  final String? profilePic;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Uri lWhatsapp =
        Uri.parse('whatsapp://send?phone=$phoneNumber&text=Hey!');

    final Uri lLinkedin = Uri.parse(linkedin);

    final Uri lInstagram = Uri.parse(instagram);

    final Uri lPhoneNumber = Uri.parse('tel: +91$phoneNumber');

    final Uri lEmail = Uri.parse('mailto:$email');

    return Container(
      margin: const EdgeInsets.all(8),
      height: 150,
      width: 350,
      decoration: const BoxDecoration(
        color: Color(0XFFD1DEFA),
        // border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: CachedNetworkImage(
                height: 125,
                width: 125,
                fit: BoxFit.cover,
                imageUrl: profilePic ??
                    'https://wallpapers.com/images/featured-full/kaneki-xsv5e4ut8mxmqae9.jpg',
                progressIndicatorBuilder: (context, url, progress) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    contribution,
                    style: const TextStyle(
                        color: kTextColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: const TextStyle(
                        color: kTextColor,
                        fontSize: 11,
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
                            await launchUrl(lPhoneNumber);
                          } catch (e) {
                            kShowSnackBar(context, SnackType.error,
                                'Dialer is not installed!');
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'whatsapp_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(lWhatsapp);
                          } catch (e) {
                            kShowSnackBar(context, SnackType.error,
                                'Whatsapp is not installed!');
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'linkedin_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(lLinkedin);
                          } catch (e) {
                            kShowSnackBar(context, SnackType.error,
                                'LinkedIn is not installed!');
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'instagram_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(
                              lInstagram,
                            );
                          } catch (e) {
                            kShowSnackBar(context, SnackType.error,
                                'Instagram is not installed!');
                          }
                        },
                      ),
                      SocialLinkButton(
                        icon: 'email_icon.svg',
                        onTap: () async {
                          try {
                            await launchUrl(lEmail);
                          } catch (e) {
                            kShowSnackBar(context, SnackType.error,
                                'G-Mail is not installed!');
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
