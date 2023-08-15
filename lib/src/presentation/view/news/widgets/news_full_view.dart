import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constants/constants.dart';

class NewsFullView extends StatelessWidget {
  const NewsFullView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back, color: kPrimaryColor)),
              title: const Text('Detailed News'),
            ),
          ],
          // if (allEventModel.bannerImage != null)
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: CachedNetworkImage(
                          height: 261,
                          width: 370,
                          imageUrl:
                              'https://images.pexels.com/photos/6899776/pexels-photo-6899776.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: FittedBox(
                        child: Text(
                          'Shiv Jayanti at DBATU',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    //   child: Text(
                    //     'Date: ${DateFormat('dd MMM yyyy').format(DateTime.parse('2023-11-22')).toUpperCase()}',
                    //     textAlign: TextAlign.end,
                    //     style: const TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //       color: kTextGreyColor,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                                  imageUrl:
                                      'https://media.gettyimages.com/id/1200556710/photo/guns-of-banaras-premiere-in-mumbai.jpg?s=2048x2048&w=gi&k=20&c=Q_XP_FOCNRJwwFglnpyUEZjnf6r1MBnZIAs-WBhpVpg='),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tara Kutiya',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Second Year - IT',
                                style: TextStyle(
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
                      padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                      child: Text(
                        'Date: ${DateFormat('dd MMM yyyy').format(DateTime.parse('2023-11-22')).toUpperCase()}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kTextGreyColor,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(descs),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    //   child: Text.rich(
                    //       textAlign: TextAlign.justify,
                    //       rich(convertNewLine(allEventModel.description ?? ''))),
                    // ),
                    const SizedBox(height: 35),
                    // if (allEventModel.bannerImage != null)
                    //   CarouselSlider(
                    //     items: allEventModel.eventImages!
                    //         .map(
                    //           (url) => Container(
                    //             margin: const EdgeInsets.symmetric(horizontal: 7),
                    //             child: ClipRRect(
                    //               borderRadius: BorderRadius.circular(7),
                    //               child: CachedNetworkImage(
                    //                 width: 376,
                    //                 height: 234,
                    //                 imageUrl: url,
                    //                 errorWidget: (context, url, error) =>
                    //                     const Icon(Icons.error),
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ),
                    //         )
                    //         .toList(),
                    //     options: CarouselOptions(
                    //         autoPlay: true,
                    //         onPageChanged: (index, reason) {
                    //           BlocProvider.of<MySliderBloc>(context).add(
                    //             MySliderOnChangedEvent(
                    //               value: index,
                    //             ),
                    //           );
                    //         },
                    //         viewportFraction: 0.85),
                    //   ),
                    // if (allEventModel.bannerImage != null)
                    //   BlocBuilder<MySliderBloc, MySliderState>(
                    //     builder: (context, pos) {
                    //       if (pos is MySliderOnChanged ||
                    //           pos is MySliderInitial) {
                    //         return DotsIndicator(
                    //           dotsCount: allEventModel.eventImages!.length,
                    //           position: pos.value,
                    //           decorator: const DotsDecorator(
                    //               color: Colors.grey, // Inactive color
                    //               activeColor: kPrimaryColor),
                    //         );
                    //       }
                    //       return const SizedBox();
                    //     },
                    //   ),
                    // const SizedBox(height: 25),
                    // const Padding(
                    //   padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    //   child: Text('Organizer:'),
                    // ),
                    // const SizedBox(height: 10),
                    // Container(
                    //   height: 130,
                    //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    //   child: GridView.builder(
                    //       gridDelegate:
                    //           const SliverGridDelegateWithMaxCrossAxisExtent(
                    //         maxCrossAxisExtent: 100,
                    //         childAspectRatio: 3 / 2,
                    //         crossAxisSpacing: 10,
                    //         mainAxisSpacing: 10,
                    //       ),
                    //       itemCount: allEventModel.organizers!.length,
                    //       itemBuilder: (BuildContext ctx, index) {
                    //         return Container(
                    //           alignment: Alignment.center,
                    //           decoration: BoxDecoration(
                    //               color: kPrimaryColor,
                    //               borderRadius: BorderRadius.circular(15)),
                    //           child: Text(
                    //             allEventModel.organizers![index],
                    //             style: const TextStyle(
                    //               color: Colors.white,
                    //             ),
                    //             textAlign: TextAlign.center,
                    //           ),
                    //         );
                    //       }),
                    // ),
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

String descs =
    'Diwali, also known as the Festival of Lights, is one of the most significant and widely celebrated festivals in India and among Hindu communities around the world. This joyous occasion is steeped in cultural and religious significance, symbolizing the victory of light over darkness and good over evil. Celebrated typically over a span of five days, Diwali is a time of great enthusiasm, fervor, and togetherness. \n\nDuring Diwali, homes and streets are adorned with vibrant decorations, intricate rangoli designs, and rows of oil lamps, or diyas, which illuminate the surroundings and create a mesmerizing spectacle. Families come together to exchange heartfelt greetings, indulge in sumptuous feasts, and offer prayers to deities, seeking blessings for prosperity and well-being. The festival also marks the worship of Goddess Lakshmi, the Hindu goddess of wealth and prosperity, with homes being meticulously cleaned and preparations made to welcome her blessings. Additionally, the skies come alive with spectacular firework displays, further adding to the festive spirit and creating a truly enchanting atmosphere. \n\nIn essence, Diwali is a time of unity, renewal, and jubilation, where communities come together to celebrate the triumph of light, love, and hope, making it a cherished and memorable event for people of all ages.';

List<String> imgList = [
  'https://images.pexels.com/photos/17518683/pexels-photo-17518683/free-photo-of-analog-minolta-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/17686105/pexels-photo-17686105/free-photo-of-animal-cute-agriculture-farm.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/17818751/pexels-photo-17818751.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
];

// class IMGS {
//   List<String> imgList = [
//   'https://images.pexels.com/photos/17518683/pexels-photo-17518683/free-photo-of-analog-minolta-camera.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
//   'https://images.pexels.com/photos/17686105/pexels-photo-17686105/free-photo-of-animal-cute-agriculture-farm.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
//   'https://images.pexels.com/photos/17818751/pexels-photo-17818751.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
// ];
// }
