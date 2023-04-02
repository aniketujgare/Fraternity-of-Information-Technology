import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';

class FITAppBar extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final Color color;

  FITAppBar({
    super.key,
    this.height = 88,
    this.color = const Color.fromARGB(255, 0, 93, 75),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(color: kPrimaryColor, height: 15),
          Container(
            height: isPortrait(context) ? preferredSize.height : 66,
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BusinessNavbar2Button(
                    label: "Menu",
                    iconAsset: "assets/images/business_navbar2/menu.svg",
                    selected: (0 == 0),
                    onClick: () {}
                    // context.read<BusinessNavbar2Cubit>().setIndex(0),
                    ),
                BusinessNavbar2Button(
                    label: "Reviews",
                    iconAsset: "assets/images/business_navbar2/reviews.svg",
                    selected: (0 == 1),
                    onClick: () {}
                    // context.read<BusinessNavbar2Cubit>().setIndex(1),
                    ),
                renderStoreIcon(
                    context: context, selected: (0 == 2), onClick: () {}),
                BusinessNavbar2Button(
                    label: "Referrals",
                    iconAsset: "assets/images/business_navbar2/Referrals.svg",
                    selected: (0 == 3),
                    onClick: () {}
                    // context.read<BusinessNavbar2Cubit>().setIndex(3),
                    ),
                BusinessNavbar2Button(
                    label: "Profile",
                    iconAsset: "assets/images/business_navbar2/profile.svg",
                    selected: (0 == 4),
                    onClick: () {}
                    // context.read<BusinessNavbar2Cubit>().setIndex(4),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

// This is a method for rendering Store Icon, this is a special icon than that because of its unique design and other rendered in a common method below.
const strokeCircle = Color(0xFFC15EF3);
const shadowShopIcon = Color(0xFF613EEA);
Widget renderStoreIcon({required context, selected = false, required onClick}) {
  Color color = (selected ? Colors.white : Colors.black);
  return InkWell(
    onTap: onClick,
    child: Container(
      width: isPortrait(context) ? 70 : 55,
      height: isPortrait(context) ? 70 : 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: selected ? kPrimaryColor : Colors.white,
          border: Border.all(color: strokeCircle),
          boxShadow: [
            BoxShadow(
              color: shadowShopIcon.withOpacity(0.50),
              blurRadius: 12.0,
              offset: const Offset(
                0,
                6,
              ),
            ),
          ]),
      child: Align(
        child: SvgPicture.asset(
          "assets/images/business_navbar2/shop.svg",
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
    ),
  );
}

class BusinessNavbar2Button extends StatelessWidget {
  final String label;
  final String iconAsset;
  final bool selected;

  final VoidCallback onClick;

  const BusinessNavbar2Button({
    super.key,
    required this.label,
    required this.iconAsset,
    required this.onClick,
    this.selected = false,
  });

  final Color neutralColor = const Color(0xFF979797);

  get color => selected ? kPrimaryColor : neutralColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        height: 70,
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              // fit: BoxFit.fitWidth,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: 5),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FITAppBar1 extends StatelessWidget {
  const FITAppBar1({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
        left: 15,
        right: 15,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(43, 21.78, 35, 18.56),
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(23),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/home_icon.svg',
            ),
            SvgPicture.asset(
              'assets/images/notepad_icon.svg',
            ),
            SizedBox(
              // height: 35,
              child: SvgPicture.asset(
                'assets/images/gallery_icon.svg',
                // fit: BoxFit.cover,
              ),
            ),
            SvgPicture.asset(
              'assets/images/profile_icon.svg',
            ),
          ],
        ),
      ),
    );
  }
}
