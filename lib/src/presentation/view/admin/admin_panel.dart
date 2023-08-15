// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../config/router/app_router_constants.dart';
// import '../../../utils/constants/constants.dart';

// class AdminPanel extends StatelessWidget {
//   const AdminPanel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: NestedScrollView(
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//             const SliverAppBar(
//               floating: true,
//               centerTitle: true,
//               leading: Icon(Icons.arrow_back, color: kPrimaryColor),
//               toolbarHeight: 75,
//               title: Text(
//                 'Administrative Hub',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color: kPrimaryColor,
//                 ),
//               ),
//             )
//           ],
//           body: Padding(
//             padding: const EdgeInsets.all(15),
//             child: GridView.count(
//                 crossAxisCount: 2,
//                 padding: const EdgeInsets.all(8),
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 15,
//                 children: [
//                   GestureDetector(
//                     onTap: () => context
//                         .pushNamed(AppRoutConstants.upcomingEventsList.name),
//                     child: Container(
//                       height: 175,
//                       width: 175,
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       decoration: BoxDecoration(
//                         color: const Color(0XFF3498db),
//                         borderRadius: BorderRadius.circular(21),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color(0x26000000),
//                             offset: Offset(0, 4),
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: const Tile(index: 0, title: 'Upcoming\nEvents'),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () =>
//                         context.pushNamed(AppRoutConstants.winnersAdmin.name),
//                     child: Container(
//                       height: 175,
//                       width: 175,
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       decoration: BoxDecoration(
//                         color: const Color(0XFF3498db),
//                         borderRadius: BorderRadius.circular(21),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color(0x26000000),
//                             offset: Offset(0, 4),
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: const Tile(index: 0, title: 'Winners\nBoard'),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () =>
//                         context.pushNamed(AppRoutConstants.winnersAdmin.name),
//                     child: Container(
//                       height: 175,
//                       width: 175,
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       decoration: BoxDecoration(
//                         color: const Color(0XFF3498db),
//                         borderRadius: BorderRadius.circular(21),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color(0x26000000),
//                             offset: Offset(0, 4),
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: const Tile(index: 0, title: 'Upcoming\nEvents'),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () => context
//                         .pushNamed(AppRoutConstants.upcomingEventsList.name),
//                     child: Container(
//                       height: 175,
//                       width: 175,
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       decoration: BoxDecoration(
//                         color: const Color(0XFF3498db),
//                         borderRadius: BorderRadius.circular(21),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color(0x26000000),
//                             offset: Offset(0, 4),
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: const Tile(index: 0, title: 'Upcoming\nEvents'),
//                     ),
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// List<String> imgs = [
//   'https://img.mensxp.com/media/content/2021/Jun/MX1400_60c201e0863f4.jpeg',
//   'https://www.famousbollywood.com/wp-content/uploads/2021/07/Indori-Ishq-season-1.jpg',
//   'https://images.bhaskarassets.com/thumb/1800x1800/web2images/521/2020/12/17/orig_03_1608162101.jpg',
//   'https://images.thequint.com/thequint%2F2021-06%2F38b4ed7a-0da3-4ede-9f6f-558577ba81e3%2FScreenshot_2021_06_08_150134.png',
// ];

// class Tile extends StatelessWidget {
//   final int index;
//   final String title;
//   const Tile({super.key, required this.index, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         // width: 155,
//         child: Text(
//       title,
//       textAlign: TextAlign.center,
//       style: const TextStyle(
//         fontSize: 22,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     ));
//   }
// }
