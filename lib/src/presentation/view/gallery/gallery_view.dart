import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/constants.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: NestedScrollView(
              // floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      // floating: true,
                      toolbarHeight: 100,
                      title: Row(
                        children: [
                          const Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 36,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 46,
                            width: 133,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(76.5)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Upload ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
              body: GridView.custom(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(2, 2),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                    const QuiltedGridTile(1, 1),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  // childCount: 10,
                  (context, index) =>
                      Tile(index: index, imageUrl: imgs[index % 4]),
                ),
              )),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final int index;
  final String imageUrl;
  const Tile({super.key, required this.index, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20)),
            ),
          );
        },
      ),
    );
  }
}

List<String> imgs = [
  'https://img.mensxp.com/media/content/2021/Jun/MX1400_60c201e0863f4.jpeg',
  'https://www.famousbollywood.com/wp-content/uploads/2021/07/Indori-Ishq-season-1.jpg',
  'https://images.bhaskarassets.com/thumb/1800x1800/web2images/521/2020/12/17/orig_03_1608162101.jpg',
  'https://images.thequint.com/thequint%2F2021-06%2F38b4ed7a-0da3-4ede-9f6f-558577ba81e3%2FScreenshot_2021_06_08_150134.png',
];
