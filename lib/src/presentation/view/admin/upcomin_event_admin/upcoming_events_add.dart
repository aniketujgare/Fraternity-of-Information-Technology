// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';
// import 'package:shimmer/shimmer.dart';

// import '../../../../domain/models/upcoming_event_model.dart';
// import '../../../../utils/constants/constants.dart';
// import '../../../blocs/date_picker_cubit/date_picker_cubit.dart';
// import '../../../blocs/image_picker_bloc/image_picker_bloc.dart';
// import '../../../blocs/image_picker_bloc/image_picker_bloc.dart';
// import '../../../widgets/fit_button.dart';
// import '../../update_account/widgets/fit_textform_field.dart';

// class UpcomingEventsAddPanel extends StatefulWidget {
//   const UpcomingEventsAddPanel({super.key});

//   @override
//   State<UpcomingEventsAddPanel> createState() => _UpcomingEventsAddPanelState();
// }

// class _UpcomingEventsAddPanelState extends State<UpcomingEventsAddPanel> {
//   TextEditingController eventTitleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController registrationLinkController = TextEditingController();
//   TextEditingController organizersController = TextEditingController();
//   String? eventDate;
//   String? eventImage;

//   @override
//   void dispose() {
//     eventTitleController.dispose();
//     descriptionController.dispose();
//     registrationLinkController.dispose();
//     organizersController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: NestedScrollView(
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//             SliverAppBar(
//               floating: true,
//               centerTitle: true,
//               leading: GestureDetector(
//                   onTap: () => context.pop(),
//                   child: const Icon(Icons.arrow_back, color: kPrimaryColor)),
//               toolbarHeight: 75,
//               title: const Text(
//                 'Upcoming Event',
//                 style: TextStyle(
//                   fontSize: 30,
//                   color: kPrimaryColor,
//                 ),
//               ),
//             )
//           ],
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   FitTextFormField(
//                     label: 'Event Title',
//                     icon: Icons.title,
//                     textFieldController: eventTitleController,
//                   ),
//                   const SizedBox(height: 15),
//                   FitTextFormField(
//                     label: 'Event Details',
//                     lines: 10,
//                     icon: Icons.description,
//                     textFieldController: descriptionController,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25),
//                     child: Text(
//                       'use /n for new line. Rest Whatsapp style formating is supported ie. *text* for bold etc.',
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   FitTextFormField(
//                     label: 'Registration Link',
//                     icon: Icons.link,
//                     lines: 1,
//                     textFieldController: registrationLinkController,
//                   ),
//                   const SizedBox(height: 15),
//                   FitTextFormField(
//                     label: 'Organizer\'s',
//                     icon: Icons.link,
//                     lines: 1,
//                     textFieldController: organizersController,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 25),
//                     child: Text(
//                       'use , to seperate multiple organizers',
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   dateField(context),
//                   const SizedBox(height: 15),
//                   imageField(context),
//                   addEventButton(context)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   FitButton addEventButton(BuildContext context) {
//     return FitButton(
//       onTap: () async {
//         bool b1 = eventTitleController.text.isEmpty;
//         bool b2 = descriptionController.text.isEmpty;
//         bool b3 = registrationLinkController.text.isEmpty;
//         bool b4 = organizersController.text.isEmpty;

//         if (!b1 &&
//             !b2 &&
//             !b3 &&
//             !b4 &&
//             eventDate != null &&
//             eventImage != null) {
//           UpcomingEventModel event = UpcomingEventModel(
//             date: eventDate!,
//             organizer: splitString(organizersController.text),
//             eventTitle: eventTitleController.text,
//             regLink: registrationLinkController.text,
//             bannerImage: eventImage!,
//             description: descriptionController.text,
//           );

//           await addEventToFirestore(context, event);
//           // ScaffoldMessenger.of(context).showSnackBar(
//           //   const SnackBar(
//           //     content: Text('Event Added Succesfully'),
//           //     backgroundColor: Colors.green,
//           //   ),
//           // );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('One or more fields are empty!!'),
//               backgroundColor: kredDarkColor,
//             ),
//           );
//         }
//       },
//       text: 'ADD Event',
//       height: 58,
//       tMargin: 30,
//       bMargin: 25,
//       showArrow: false,
//     );
//   }

//   Padding imageField(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Event Banner/Poster Image',
//                 style: TextStyle(
//                   color: Color(0XFFADB6C1),
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               BlocBuilder<ImagePickerBloc, ImagePickerState>(
//                 builder: (context, state) {
//                   if (state is ImageIsPicked) {
//                     eventImage = state.imageFile.path;
//                     return ClipRRect(
//                       borderRadius: BorderRadius.circular(28),
//                       child: Image.file(
//                         state.imageFile,
//                         fit: BoxFit.cover,
//                         height: MediaQuery.of(context).size.width * 0.6,
//                         width: MediaQuery.of(context).size.width * 0.6,
//                       ),
//                     );
//                   }
//                   return Shimmer.fromColors(
//                     baseColor: Colors.grey.shade300,
//                     highlightColor: Colors.grey.shade100,
//                     child: Container(
//                       height: MediaQuery.of(context).size.width * 0.6,
//                       width: MediaQuery.of(context).size.width * 0.6,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(28),
//                       ),
//                     ),
//                   ); // Placeholder or empty container for image preview
//                 },
//               ),
//             ],
//           ),
//           IconButton(
//             onPressed: () =>
//                 context.read<ImagePickerBloc>().add(PickImageEvent()),
//             icon: const CircleAvatar(
//               backgroundColor: kPrimaryColor,
//               radius: 23,
//               child: Icon(
//                 Icons.image,
//                 color: Colors.white,
//               ),
//             ),
//             splashRadius: 25,
//             iconSize: 35,
//             highlightColor: kPrimaryColor.withOpacity(0.3),
//             splashColor: kPrimaryColor.withOpacity(0.3),
//           ),
//         ],
//       ),
//     );
//   }

//   Padding dateField(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 58,
//             width: MediaQuery.of(context).size.width * 0.6,
//             decoration: BoxDecoration(
//               color: const Color(0XFFF7F8F9),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 width: 1,
//                 color: const Color(0XFFECEFF5),
//               ),
//             ),
//             child: Row(
//               children: [
//                 const SizedBox(width: 12),
//                 const Icon(Icons.calendar_month, color: Color(0XFFADB6C1)),
//                 const SizedBox(width: 12),
//                 BlocBuilder<DatePickerCubit, DatePickerState>(
//                   builder: (context, state) {
//                     if (state is DateSelectedState) {
//                       eventDate = DateFormat('dd MMM yyyy')
//                           .format(DateTime.parse(state.date))
//                           .toUpperCase();
//                       return Text(eventDate!,
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ));
//                     }
//                     return const Text('Event Date',
//                         style: TextStyle(
//                           color: Color(0XFFADB6C1),
//                           fontSize: 16,
//                         ));
//                   },
//                 )
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: () => context.read<DatePickerCubit>().pickDate(context),
//             icon: const CircleAvatar(
//               backgroundColor: kPrimaryColor,
//               radius: 23,
//               child: Icon(
//                 Icons.calendar_month_rounded,
//                 color: Colors.white,
//               ),
//             ),
//             splashRadius: 25,
//             iconSize: 35,
//             highlightColor: kPrimaryColor.withOpacity(0.3),
//             splashColor: kPrimaryColor.withOpacity(0.3),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Future<void> addEventToFirestore(
//     BuildContext context, UpcomingEventModel event) async {
//   final CollectionReference eventsCollection =
//       FirebaseFirestore.instance.collection('upcoming_events');

//   try {
//     await eventsCollection.doc().set(event.toJson());
//     debugPrint('Event added to Firestore');
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Event Added Succesfully'),
//         backgroundColor: Colors.green,
//       ),
//     );
//   } catch (error) {
//     debugPrint('Error adding event to Firestore: $error');
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Something went Wrong, please try again!'),
//         backgroundColor: kredDarkColor,
//       ),
//     );
//   }
// }

// List<String> splitString(String input) {
//   List<String> substrings = input.split(',');
//   List<String> cleanedSubstrings = [];

//   for (var substring in substrings) {
//     if (substring.trim().isNotEmpty) {
//       cleanedSubstrings.add(substring.trim());
//     }
//   }

//   return cleanedSubstrings;
// }
