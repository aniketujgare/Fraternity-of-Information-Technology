import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/app_router_constants.dart';
import '../../../../domain/models/news_model.dart';
import '../../../../utils/constants/constants.dart';

class NewsCard extends StatelessWidget {
  final NewsModel newsModel;
  const NewsCard({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutConstants.newsFullView.name,
          extra: newsModel),
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
                imageUrl: newsModel.coverImage ?? '',
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
                Text(
                  newsModel.newsTitle ?? '',
                  style: const TextStyle(
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
                        imageUrl: newsModel.newsWritersPicture ?? '',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsModel.newsWritersName ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${newsModel.writersDepartment}: ${newsModel.writersYear} | Date: ${kFormatDate(newsModel.newsDate!)}',
                          style: const TextStyle(
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
