import 'package:flutter/material.dart';

import '../../../utils/constants/constants.dart';
import 'widgets/notification_card.dart';
import 'widgets/notifications_header.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const NotificationsHeader(),
          Expanded(
            child: ListView.separated(
              itemCount: 21,
              itemBuilder: (context, index) {
                return NotificationCard(
                  name: 'Grishma, Nil and +19 others',
                  subMessage: 'wants to connect.',
                  time: '10m ago',
                  avatarBackColor: colorsList[index % colorsList.length],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: kTextGreyColor.withOpacity(0.5),
                  thickness: 0.5,
                  indent: 40,
                  endIndent: 40,
                );
              },
            ),
          )
          // FriendsAndInvitation(),
        ],
      )),
    );
  }
}

const colorsList = [
  Color(0xff6a87f3),
  Color(0xffdb736e),
  Color(0xff75cdff),
  Color(0xfffecc1d),
  Color(0xfff3206d),
  Color(0xff185bff),
];
const imageUrls = [
  'https://w0.peakpx.com/wallpaper/368/441/HD-wallpaper-cute-anime-girl-anime-cat-girl-anime-girl-cartoon-cat-girl-cute-anime-thumbnail.jpg',
  'https://w0.peakpx.com/wallpaper/85/561/HD-wallpaper-cute-anime-boy-thumbnail.jpg',
  'https://w0.peakpx.com/wallpaper/526/877/HD-wallpaper-brown-hair-anime-school-girl-earphones-school-uniform-anime-thumbnail.jpg',
  'https://w0.peakpx.com/wallpaper/87/389/HD-wallpaper-anime-boy-aesthetic-aesthetic-anime-boy-anime-anime-boy-anime-boys-cute-cute-anime-boy-cute-anime-boys-pink-sad-anime-boy-thumbnail.jpg',
  'https://w0.peakpx.com/wallpaper/959/292/HD-wallpaper-arknights-anime-girl-animal-ears-white-hair-bodysuit-anime-thumbnail.jpg',
];
