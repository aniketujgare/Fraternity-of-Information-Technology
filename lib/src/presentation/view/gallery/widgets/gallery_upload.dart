import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constants/constants.dart';
import '../../../blocs/date_picker_cubit/date_picker_cubit.dart';
import '../../../blocs/gallery_bloc/gallery_bloc.dart';
import '../../../blocs/gallery_upload_bloc/gallery_upload_bloc.dart';
import '../../../widgets/uploading_images_animation.dart';

String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class GalleryUploadView extends StatelessWidget {
  const GalleryUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              toolbarHeight: 100,
              centerTitle: true,
              title: Text(
                'Pick Images',
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocConsumer<GalleryUploadBloc, GalleryUploadState>(
                    listener: (context, state) {
                      if (state is ImagePickerErrorState) {
                        kShowSnackBar(
                            context, SnackType.error, 'Error Occured!');
                      }
                      if (state is ImagesUploadComplete) {
                        kShowSnackBar(context, SnackType.success,
                            'Images Uploaded Succesfully 🎉');
                        context
                            .read<GalleryBloc>()
                            .add(LoadGalleryOnNewPicAddedEvent());
                        context.pop();
                      }
                    },
                    builder: (context, state) {
                      if (state is ImagesUploadingState) {
                        return Container(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 0.6,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: const UploadingImagesAnimation());
                      }
                      if (state is ImagePickerLoaded) {
                        return Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height * 0.6,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: kPrimaryColor,
                              width: 3.0,
                            ),
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: state.selectedImages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 110,
                                  width: 110,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Image.file(
                                            File(state
                                                .selectedImages[index].path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Remove the image at the given index
                                            context
                                                .read<GalleryUploadBloc>()
                                                .add(RemoveImageEvent(
                                                    imgName: state
                                                        .selectedImages[index]
                                                        .name));
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kredDarkColor,
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height * 0.6,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 3.0,
                          ),
                        ),
                      );
                    },
                  ),
                  dateField(context),
                  pickAndUploadButtons(context),
                ],
              ),
            ),
          ],
          // physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Padding pickAndUploadButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () =>
                context.read<GalleryUploadBloc>().add(PickImagesEvent()),
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
                    'Pick ',
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
          ),
          BlocBuilder<GalleryUploadBloc, GalleryUploadState>(
            builder: (context, state) {
              if (state is ImagePickerLoaded) {
                return GestureDetector(
                  onTap: () => context.read<GalleryUploadBloc>().add(
                      UploadImagesEvent(
                          selectedImage: state.selectedImages,
                          date: selectedDate)),
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
                          Icons.upload,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container(
                height: 46,
                width: 133,
                decoration: BoxDecoration(
                    color: Colors.grey,
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
                      Icons.upload,
                      size: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

Padding dateField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 58,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: const Color(0XFFF7F8F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: const Color(0XFFECEFF5),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Icon(Icons.calendar_month, color: Color(0XFFADB6C1)),
              const SizedBox(width: 12),
              BlocBuilder<DatePickerCubit, DatePickerState>(
                builder: (context, state) {
                  if (state is DateSelectedState) {
                    selectedDate = DateFormat('yyyy-MM-dd')
                        .format(DateTime.parse(state.date));
                    return Text(selectedDate,
                        style: const TextStyle(
                          fontSize: 16,
                        ));
                  }
                  return const Text('Event Date',
                      style: TextStyle(
                        color: Color(0XFFADB6C1),
                        fontSize: 16,
                      ));
                },
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () => context.read<DatePickerCubit>().pickDate(context),
          icon: const CircleAvatar(
            backgroundColor: kPrimaryColor,
            radius: 23,
            child: Icon(
              Icons.calendar_month_rounded,
              color: Colors.white,
            ),
          ),
          splashRadius: 25,
          iconSize: 35,
          highlightColor: kPrimaryColor.withOpacity(0.3),
          splashColor: kPrimaryColor.withOpacity(0.3),
        ),
      ],
    ),
  );
}
