import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fraternity_of_information_technology/src/config/router/app_router_constants.dart';
import 'package:go_router/go_router.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutConstants.newsFullView.name),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  offset: Offset(0, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(38),
              child: CachedNetworkImage(
                width: 367,
                height: 369,
                fit: BoxFit.cover,
                imageUrl:
                    'https://images.pexels.com/photos/6899776/pexels-photo-6899776.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
          ),
          Container(
            width: 367,
            height: 369,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              gradient: const LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 1),
                colors: [Color(0X00FFFFFF), Color(0XA66a87f3)],
                stops: [0.604, 0.766],
              ),
            ),
          ),
          Positioned(
            left: 25,
            bottom: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shiv Jayanti at DBATU',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 1.26,
                    color: Color(0xfff6f6f6),
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                          height: 49,
                          width: 49,
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://media.gettyimages.com/id/1236523111/photo/bollywood-actress-vaani-kapoor-poses-for-a-photo-during-a-film-promotion-event-of-her.jpg?s=612x612&w=0&k=20&c=ip79Esmr1RNS7kEgMN2Zrionw5PRT1318rx1FkMt_-Y='),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tara Kutiya',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Celebration of cheating nights with Tara.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'IT: Final Year | Date: 15 AUG 2023',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
