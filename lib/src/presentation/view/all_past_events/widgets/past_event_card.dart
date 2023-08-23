import 'package:flutter/material.dart';
import 'package:fraternity_of_information_technology/src/config/router/app_router_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/event_model.dart';

// enum EventType { contest, workshop, ceremony }

// Map the enum to strings
Map<EventType, String> eventTypeToString = {
  EventType.contest: 'contest',
  EventType.workshop: 'workshop',
  EventType.ceremony: 'ceremony',
};
EventType retrieveEnumFromFirestore(String enumValue) {
  // Reverse the mapping
  EventType eventType = EventType.values
      .firstWhere((type) => eventTypeToString[type] == enumValue);
  return eventType;
}

Map<EventType, Color> tertiaryColor = {
  EventType.contest: const Color(0XFF1E2E69),
  EventType.ceremony: const Color(0XFF3E2723),
  EventType.workshop: const Color(0XFF006064),
};

Map<EventType, Color> secondaryColor = {
  EventType.contest: const Color(0XFFD1DEFA),
  EventType.ceremony: const Color(0XFFD7CCC8),
  EventType.workshop: const Color(0XFFC6DFEC),
};
Map<EventType, Color> primaryColor = {
  EventType.contest: const Color(0XFFEAF0FE),
  EventType.ceremony: const Color(0XFFEEEEEE),
  EventType.workshop: const Color(0XFFE3EBF1),
};

class PastEventCard extends StatelessWidget {
  final EventType eventType;
  final EventModel eventModel;

  const PastEventCard({
    Key? key,
    required this.eventType,
    required this.eventModel,
  }) : super(key: key);
  String trim(String eventTypeString) {
    String eventTypeValue = eventTypeString.split('.')[1];
    String formattedEventType =
        eventTypeValue[0].toUpperCase() + eventTypeValue.substring(1);
    return formattedEventType;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutConstants.pastEventFullView.name,
          extra: eventModel),
      child: Container(
        height: 97,
        width: double.maxFinite, //365,
        margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 10.5),
        decoration: BoxDecoration(
          color: primaryColor[eventType],
          borderRadius: BorderRadius.circular(21),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(0, 1.5),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 73,
              decoration: BoxDecoration(
                color: secondaryColor[eventType],
                borderRadius: BorderRadius.circular(21),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.MMM()
                        .format(DateTime.parse(eventModel.eventDate!))
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      color: tertiaryColor[eventType],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('dd:yy')
                        .format(DateTime.parse(eventModel.eventDate!))
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      color: tertiaryColor[eventType],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      eventModel.eventTitle ?? ' ',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0XFF000007),
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 3),
                  Text(
                    trim(eventType.toString()),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0XFF8E9090),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 61,
              height: double.maxFinite,
              decoration: BoxDecoration(
                // color: secondaryColor[eventType],
                borderRadius: BorderRadius.circular(21),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: secondaryColor[eventType],
                    child: Icon(
                      Icons.arrow_outward,
                      color: tertiaryColor[eventType],
                    ),
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
