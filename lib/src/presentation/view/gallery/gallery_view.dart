import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/router/app_router_constants.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/gallery_bloc/gallery_bloc.dart';
import '../../widgets/fit_circular_loading_indicator.dart';

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
                    GestureDetector(
                      onTap: () => context
                          .pushNamed(AppRoutConstants.galleryUploadView.name),
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              )
            ],
            body: BlocConsumer<GalleryBloc, GalleryState>(
              listener: (context, state) {
                if (state is GalleryErrorState) {
                  kShowSnackBar(context, SnackType.error,
                      'Error Loading Gallery Images!');
                }
              },
              builder: (context, state) {
                if (state is GalleryLoaded) {
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Column(
                            children: state.galleryList
                                .map(
                                  (gallery) => Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(DateFormat('MMM yyyy')
                                                .format(DateTime.parse(
                                                    gallery.date!))
                                                .toUpperCase()),
                                            const Icon(Icons.filter_list),
                                          ],
                                        ),
                                      ),
                                      GridView.custom(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        gridDelegate: SliverQuiltedGridDelegate(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 4,
                                          crossAxisSpacing: 4,
                                          repeatPattern:
                                              QuiltedGridRepeatPattern.inverted,
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
                                        childrenDelegate:
                                            SliverChildBuilderDelegate(
                                                childCount:
                                                    gallery.images?.length ?? 0,
                                                (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return PhotoView(
                                                      imageProvider:
                                                          CachedNetworkImageProvider(
                                                              gallery.images![
                                                                  index]));
                                                },
                                              );
                                            },
                                            child: Tile(
                                              index: index,
                                              imageUrl: gallery.images![index],
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                )
                                .toList()),
                        const SizedBox(height: 105),
                      ]))
                    ],
                  );
                }
                return const Center(
                  child: FITCircularLoadingIndicator(),
                );
              },
            ),
          ),
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
