import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AlertType { like, comment }

class NotificationCard extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final String subMessage;
  final String time;
  final bool isLikesAndComments;
  final AlertType alertType;
  final Color avatarBackColor;

  const NotificationCard({
    super.key,
    required this.name,
    required this.time,
    this.subMessage = '',
    this.avatarUrl,
    this.alertType = AlertType.like,
    this.isLikesAndComments = false,
    required this.avatarBackColor,
  });
  static const likeImage = 'assets/svgs/like.svg';
  static const commentImage = 'assets/svgs/comment.svg';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 10, 22, 10),
      color: Colors.white,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* Color ring behind avatar
          CircleAvatar(
            backgroundColor: avatarBackColor,
            radius: 35,
            child: CircleAvatar(
                radius: 26.5,
                //ToDo: assign custom image for users without
                backgroundImage: CachedNetworkImageProvider(avatarUrl ??
                    'https://w0.peakpx.com/wallpaper/368/441/HD-wallpaper-cute-anime-girl-anime-cat-girl-anime-girl-cartoon-cat-girl-cute-anime-thumbnail.jpg')),
          ),
          const SizedBox(width: 33),

          Container(
            constraints: const BoxConstraints(
              maxWidth: 223,
            ),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.2599999905,
                  color: Color(0xff0b1c3d),
                ),
                children: [
                  TextSpan(
                    text: 'Workshop on ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.26,
                      color: Color(0xff9ca0af),
                    ),
                  ),
                  TextSpan(
                    text: 'Data Structures & Algorithms',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.26,
                      color: Color(0xff0b1c3d),
                    ),
                  ),
                  TextSpan(
                    text: ' organized by',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.26,
                      color: Color(0xff9ca0af),
                    ),
                  ),
                  TextSpan(
                    text: ' Tara \nKutiyaa ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.26,
                      color: Color(0xff0b1c3d),
                    ),
                  ),
                  TextSpan(
                    text: 'on',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.26,
                      color: Color(0xff9ca0af),
                    ),
                  ),
                  TextSpan(
                    text: ' 13th of Aug.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.26,
                      color: Color(0xff0b1c3d),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
