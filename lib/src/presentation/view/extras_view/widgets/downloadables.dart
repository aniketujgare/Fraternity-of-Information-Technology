import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../utils/constants/constants.dart';
import '../../../blocs/extras_bloc/extras_bloc.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';

Container downloadables() {
  return Container(
    width: double.maxFinite, //365,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
    decoration: BoxDecoration(
      color: const Color(0XFFEAF0FE),
      border: Border.all(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(
        8,
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x26000000),
          offset: Offset(0, 1.5),
          blurRadius: 0.8,
        ),
      ],
    ),

    child: ExpansionTile(
      collapsedShape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      textColor: Colors.black,
      title: const Text(
        'Downloadables',
        style: TextStyle(
          fontSize: 16,
          color: Color(0XFF1E2E69),
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 0, bottom: 25),
          itemBuilder: (context, index) => downloadableItem(context),
          separatorBuilder: (context, index) =>
              const SizedBox(height: 45, child: Divider()),
          itemCount: 1,
        ),
      ],
    ),
  );
}

BlocBuilder downloadableItem(BuildContext context) {
  return BlocBuilder<ExtrasBloc, ExtrasState>(
    builder: (context, state) {
      if (state is ExtrasLoaded) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: state.extrasModel.fitLogo!.png!,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28)),
                    margin: const EdgeInsets.only(right: 15),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                OutlinedButton.icon(
                  onPressed: () async =>
                      SchedulerBinding.instance.addPostFrameCallback((_) async {
                    await FlutterDownloader.enqueue(
                      url: state.extrasModel.fitLogo!.jpg!,
                      fileName: 'FIT_Logo_JPG_${UniqueKey()}.jpg',
                      savedDir: Directory('/storage/emulated/0/Download').path,
                      saveInPublicStorage: true,
                      showNotification:
                          true, // show download progress in status bar (for Android)
                      openFileFromNotification:
                          true, // click on notification to open downloaded file (for Android)
                    );
                  }),

                  // await FlutterDownloader.enqueue(
                  //   url: state.extrasModel.fitLogo!.jpg!,
                  //   fileName: 'FIT_Logo_JPG_${UniqueKey()}.jpg',
                  //   savedDir: Directory('/storage/emulated/0/Download').path,
                  //   saveInPublicStorage: true,
                  //   showNotification:
                  //       true, // show download progress in status bar (for Android)
                  //   openFileFromNotification:
                  //       true, // click on notification to open downloaded file (for Android)
                  // ),
                  icon: const Icon(
                    Icons.download,
                    size: 24.0,
                  ),
                  label: const Text('JPG'),
                ),
                OutlinedButton.icon(
                  onPressed: () async =>
                      SchedulerBinding.instance.addPostFrameCallback((_) async {
                    await FlutterDownloader.enqueue(
                      url: state.extrasModel.fitLogo!.png!,
                      fileName: 'FIT_Logo_PNG_${UniqueKey()}.png',
                      savedDir: Directory('/storage/emulated/0/Download').path,
                      saveInPublicStorage: true,
                      showNotification:
                          true, // show download progress in status bar (for Android)
                      openFileFromNotification:
                          true, // click on notification to open downloaded file (for Android)
                    );
                  }),
                  icon: const Icon(
                    Icons.download,
                    size: 24.0,
                  ),
                  label: const Text('PNG'),
                ),
                OutlinedButton.icon(
                  onPressed: () async =>
                      SchedulerBinding.instance.addPostFrameCallback((_) async {
                    await launchUrlString(state.extrasModel.fitLogo!.png!,
                        mode: LaunchMode.externalApplication);
                  }),
                  icon: const Icon(
                    CupertinoIcons.globe,
                    size: 24.0,
                  ),
                  label: const Text('Web'),
                ),
              ],
            ),
          ],
        );
      }
      return const FITCircularLoadingIndicator();
    },
  );
}
