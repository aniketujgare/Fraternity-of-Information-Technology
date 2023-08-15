import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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
    this.profilePic,
    required this.year,
  });

  final String branch;
  final String email;
  final String instagram;
  final String linkedin;
  final String name;
  final String phoneNumber;
  final String position;
  final String? profilePic;
  final String year;

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
        color: kGrayCardColor,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            // BlocBuilder<FitCommitteeBloc, FitCommitteeState>(
            //     builder: (context, state) {
            //       if (state is FetchUserState) {
            //         return ClipOval(
            //           child: CachedNetworkImage(
            //               height: 50,
            //               width: 50,
            //               fit: BoxFit.cover,
            //               imageUrl: state.userModel.profilePic ??
            //                   'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/images%2FIMG-20230620-WA0005.jpg?alt=media&token=f261198f-e266-4c56-a186-212872527431'),
            //         );
            //       }
            //       return Shimmer.fromColors(
            //         baseColor: Colors.grey.shade300,
            //         highlightColor: Colors.grey.shade100,
            //         child: Container(
            //           height: 50,
            //           width: 50,
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(25)),
            //           margin: const EdgeInsets.only(right: 15),
            //         ),
            //       );
            //     },
            //   ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                          borderRadius: BorderRadius.circular(20)),
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
                            await launchUrl(lPhoneNumber);
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
                            await launchUrl(lWhatsapp);
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
                            await launchUrl(lLinkedin);
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
                              lInstagram,
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
                            await launchUrl(lEmail);
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
