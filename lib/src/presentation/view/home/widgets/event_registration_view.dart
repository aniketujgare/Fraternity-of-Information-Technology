import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../domain/models/event_model.dart';
import '../../../../utils/constants/constants.dart';
import '../../../widgets/fit_button.dart';

class EventRegistrationView extends StatelessWidget {
  final EventModel event;
  const EventRegistrationView({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            if (event.bannerImage != null)
              DynamicSliverAppBar(
                leadingWidth: 50,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                      onTap: () => context.pop(),
                      child: SvgPicture.asset(
                        'assets/images/back_button.svg',
                        // height: 18,
                      )),
                ),
                flexibleSpace: CachedNetworkImage(
                  width: double.maxFinite,
                  imageUrl: event.bannerImage ??
                      'https://firebasestorage.googleapis.com/v0/b/fit-2022-23.appspot.com/o/downloadables%2Ffit_logo_png.png?alt=media&token=8fdf744e-6670-4f69-9b82-8c224f5f93f2',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fitWidth,
                ),
              ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: SizedBox(
                      // color: Colors.red,
                      height: 50,
                      child: FittedBox(
                        // fit: BoxFit.scaleDown,
                        child: Text(
                          event.eventTitle!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 22,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Text.rich(
                        textAlign: TextAlign.justify,
                        kRich(kConvertNewLine(event.eventDescription!))),
                  ),
                  if (event.eventOrganizers!.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Text(
                        'Organizer\'s:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (event.eventOrganizers != null)
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: event.eventOrganizers!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                event.eventOrganizers![index],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }),
                    ),
                  FitButton(
                    onTap: () async {
                      try {
                        await launchUrlString(event.registrationUrl!,
                            mode: LaunchMode.externalApplication);
                      } catch (e) {
                        if (context.mounted) {
                          kShowSnackBar(
                              context, SnackType.error, 'Link does not found!');
                        }
                      }
                    },
                    text: 'Register',
                    bMargin: 50,
                    tMargin: 20,
                    height: 50,
                    showArrow: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventDescription extends StatelessWidget {
  final String fitGreeting;
  final List<String> games;

  const EventDescription(
      {super.key, required this.fitGreeting, required this.games});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$fitGreeting\nWe are honored and excited to announce the E-Sports Event. The games included in this event are:',
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: games.map((game) => bulletPoint(game)).toList(),
          ),
          const SizedBox(height: 16),
          const Text(
            '\u2022 ON 1st - 2nd June\n\u2022 Total Cash Price of 5000 Rs\n\u2022 Students from All Over the University and IOPE are welcome to participate',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(Icons.circle, size: 12),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}

class DynamicSliverAppBar extends StatefulWidget {
  const DynamicSliverAppBar({
    this.flexibleSpace,
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.forceElevated = false,
    this.backgroundColor,
    this.backgroundGradient,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.collapsedHeight,
    this.expandedHeight,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = kToolbarHeight + 20,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.appBarClipper,
  });

  final Widget? flexibleSpace;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final bool forceElevated;
  final Color? backgroundColor;

  /// If backgroundGradient is non null, backgroundColor will be ignored
  final LinearGradient? backgroundGradient;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double? expandedHeight;
  final double? collapsedHeight;
  final bool floating;
  final bool pinned;
  final ShapeBorder? shape;
  final double toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final bool snap;
  final bool stretch;
  final double stretchTriggerOffset;
  final AsyncCallback? onStretchTrigger;
  final CustomClipper<Path>? appBarClipper;

  @override
  DynamicSliverAppBarState createState() => DynamicSliverAppBarState();
}

class DynamicSliverAppBarState extends State<DynamicSliverAppBar> {
  final GlobalKey _childKey = GlobalKey();

  // As long as the height is 0 instead of the sliver app bar a sliver to box adapter will be used
  // to calculate dynamically the size for the sliver app bar
  double _height = 0;

  @override
  void initState() {
    super.initState();
    _updateHeight();
  }

  @override
  void didUpdateWidget(covariant DynamicSliverAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateHeight();
  }

  void _updateHeight() {
    // Gets the new height and updates the sliver app bar. Needs to be called after the last frame has been rebuild
    // otherwise this will throw an error
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_childKey.currentContext == null) return;
      setState(() {
        _height = (_childKey.currentContext!.findRenderObject()! as RenderBox)
            .size
            .height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Needed to lay out the flexibleSpace the first time, so we can calculate its intrinsic height
    if (_height == 0) {
      return SliverToBoxAdapter(
        child: Stack(
          children: [
            Padding(
              // Padding which centers the flexible space within the app bar
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.paddingOf(context).top / 2),
              child: Container(
                  key: _childKey,
                  child: widget.flexibleSpace ??
                      const SizedBox(height: kToolbarHeight)),
            ),
            Positioned.fill(
              // 10 is the magic number which the app bar is pushed down within the sliver app bar. Couldnt find exactly where this number
              // comes from and found it through trial and error.
              top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: widget.leading,
                  actions: widget.actions,
                ),
              ),
            )
          ],
        ),
      );
    }

    return SliverAppBar(
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: widget.title,
      actions: widget.actions,
      bottom: widget.bottom,
      elevation: widget.elevation,
      scrolledUnderElevation: widget.scrolledUnderElevation,
      shadowColor: widget.shadowColor,
      surfaceTintColor: widget.surfaceTintColor,
      forceElevated: widget.forceElevated,
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      iconTheme: widget.iconTheme,
      actionsIconTheme: widget.actionsIconTheme,
      primary: widget.primary,
      centerTitle: widget.centerTitle,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      titleSpacing: widget.titleSpacing,
      collapsedHeight: widget.collapsedHeight,
      floating: widget.floating,
      pinned: widget.pinned,
      snap: widget.snap,
      stretch: widget.stretch,
      stretchTriggerOffset: widget.stretchTriggerOffset,
      onStretchTrigger: widget.onStretchTrigger,
      shape: widget.shape,
      toolbarHeight: widget.toolbarHeight,
      expandedHeight: _height,
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: widget.toolbarTextStyle,
      titleTextStyle: widget.titleTextStyle,
      systemOverlayStyle: widget.systemOverlayStyle,
      forceMaterialTransparency: widget.forceMaterialTransparency,
      clipBehavior: widget.clipBehavior,
      flexibleSpace: FlexibleSpaceBar(background: widget.flexibleSpace),
    );
  }
}
