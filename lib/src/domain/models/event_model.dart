// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

enum EventType { contest, workshop, ceremony }

class EventModel {
  final String? eventTitle;
  final String? eventDate;
  final List<String>? eventOrganizers;
  final String? eventDescription;
  final String? bannerImage;
  final List<String>? eventImages;
  final String? registrationUrl;
  final String? eventId;
  final EventType? eventType;

  EventModel({
    this.eventTitle,
    this.eventDate,
    this.eventOrganizers,
    this.eventDescription,
    this.bannerImage,
    this.eventImages,
    this.registrationUrl,
    this.eventId,
    this.eventType,
  });

  EventModel copyWith({
    String? eventTitle,
    String? eventDate,
    List<String>? eventOrganizers,
    String? eventDescription,
    String? bannerImage,
    List<String>? eventImages,
    String? registrationUrl,
    String? eventId,
    EventType? eventType,
  }) =>
      EventModel(
        eventTitle: eventTitle ?? this.eventTitle,
        eventDate: eventDate ?? this.eventDate,
        eventOrganizers: eventOrganizers ?? this.eventOrganizers,
        eventDescription: eventDescription ?? this.eventDescription,
        bannerImage: bannerImage ?? this.bannerImage,
        eventImages: eventImages ?? this.eventImages,
        registrationUrl: registrationUrl ?? this.registrationUrl,
        eventId: eventId ?? this.eventId,
        eventType: eventType ?? this.eventType,
      );

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventTitle: json["eventTitle"],
        eventDate: json["eventDate"],
        eventOrganizers: json["eventOrganizers"] == null
            ? []
            : List<String>.from(json["eventOrganizers"]!.map((x) => x)),
        eventDescription: json["eventDescription"],
        bannerImage: json["bannerImage"],
        eventImages: json["eventImages"] == null
            ? []
            : List<String>.from(json["eventImages"]!.map((x) => x)),
        registrationUrl: json["registrationUrl"],
        eventId: json["eventId"],
        eventType: _parseEventType(json['eventType']),
      );

  Map<String, dynamic> toJson() => {
        "eventTitle": eventTitle,
        "eventDate": eventDate,
        "eventOrganizers": eventOrganizers == null
            ? []
            : List<dynamic>.from(eventOrganizers!.map((x) => x)),
        "eventDescription": eventDescription,
        "bannerImage": bannerImage,
        "eventImages": eventImages == null
            ? []
            : List<dynamic>.from(eventImages!.map((x) => x)),
        "registrationUrl": registrationUrl,
        "eventId": eventId,
        "eventType": eventType.toString().split('.').last,
      };

  static EventType? _parseEventType(String? value) {
    if (value == 'contest') {
      return EventType.contest;
    } else if (value == 'workshop') {
      return EventType.workshop;
    } else if (value == 'ceremony') {
      return EventType.ceremony;
    }
    return null;
  }
}
