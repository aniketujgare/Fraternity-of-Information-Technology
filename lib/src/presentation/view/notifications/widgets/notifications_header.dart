import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/constants/constants.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      height: 65,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset(
                  'assets/images/back_button.svg',
                  height: 18,
                )),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: kHeading1FontSize,
                fontWeight: FontWeight.w400,
                height: 1.26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
