import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/news_model.dart';
import '../../../../utils/constants/constants.dart';
import '../../../blocs/my_slider/my_slider_bloc.dart';

class NewsFullView extends StatelessWidget {
  final NewsModel newsModel;
  const NewsFullView({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              toolbarHeight: 70,
              leadingWidth: 50,
              leading: SizedBox(),

              // Padding(
              //   padding: const EdgeInsets.only(left: 25),
              //   child: GestureDetector(
              //       onTap: () => context.pop(),
              //       child: SvgPicture.asset(
              //         'assets/images/back_button.svg',
              //       )),
              // ),
              centerTitle: true,
              floating: true,
              title: Text(
                'Detailed News',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: kHeading2FontSize,
                ),
              ),
            ),
          ],
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: CachedNetworkImage(
                          height: 261,
                          width: 370,
                          imageUrl: newsModel.coverImage ?? '',
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: FittedBox(
                        child: Text(
                          newsModel.newsTitle ?? '',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: const Color(0XFFFECC1D),
                            child: ClipOval(
                              child: CachedNetworkImage(
                                height: 38,
                                width: 38,
                                fit: BoxFit.cover,
                                imageUrl: newsModel.newsWritersPicture ?? '',
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newsModel.newsWritersName ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${newsModel.writersYear} - ${newsModel.writersDepartment}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0XFF808386),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                      child: Text(
                        'Date: ${kFormatDate(newsModel.newsDate!)}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kTextGreyColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text.rich(
                        textAlign: TextAlign.justify,
                        kRich(
                          kConvertNewLine(newsModel.newsContent ?? ''),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    if (newsModel.subImages != null)
                      CarouselSlider(
                        items: newsModel.subImages!
                            .map(
                              (url) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: CachedNetworkImage(
                                    width: 376,
                                    height: 234,
                                    imageUrl: url,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              BlocProvider.of<MySliderBloc>(context).add(
                                MySliderOnChangedEvent(
                                  value: index,
                                ),
                              );
                            },
                            viewportFraction: 0.85),
                      ),
                    if (newsModel.subImages != null)
                      BlocBuilder<MySliderBloc, MySliderState>(
                        builder: (context, pos) {
                          if (pos is MySliderOnChanged ||
                              pos is MySliderInitial) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: DotsIndicator(
                                dotsCount: newsModel.subImages!.length,
                                position: pos.value,
                                decorator: const DotsDecorator(
                                    color: Colors.grey, // Inactive color
                                    activeColor: kPrimaryColor),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
