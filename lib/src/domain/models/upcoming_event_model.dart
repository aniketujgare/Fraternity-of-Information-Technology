// To parse this JSON data, do
//
//     final upcomingEventModel = upcomingEventModelFromJson(jsonString);

import 'dart:convert';

UpcomingEventModel upcomingEventModelFromJson(String str) =>
    UpcomingEventModel.fromJson(json.decode(str));

String upcomingEventModelToJson(UpcomingEventModel data) =>
    json.encode(data.toJson());

class UpcomingEventModel {
  final String? bannerImage;
  final String? date;
  final String? description;
  final String? docId;
  final String? eventTitle;
  final List<String>? organizer;
  final String? regLink;

  UpcomingEventModel({
    this.bannerImage,
    this.date,
    this.description,
    this.docId,
    this.eventTitle,
    this.organizer,
    this.regLink,
  });

  UpcomingEventModel copyWith({
    String? bannerImage,
    String? date,
    String? description,
    String? docId,
    String? eventTitle,
    List<String>? organizer,
    String? regLink,
  }) =>
      UpcomingEventModel(
        bannerImage: bannerImage ?? this.bannerImage,
        date: date ?? this.date,
        description: description ?? this.description,
        docId: docId ?? this.docId,
        eventTitle: eventTitle ?? this.eventTitle,
        organizer: organizer ?? this.organizer,
        regLink: regLink ?? this.regLink,
      );

  factory UpcomingEventModel.fromJson(Map<String, dynamic> json) =>
      UpcomingEventModel(
        bannerImage: json["banner_image"],
        date: json["date"],
        description: json["description"],
        docId: json["doc_id"],
        eventTitle: json["event_title"],
        organizer: json["organizer"] == null
            ? []
            : List<String>.from(json["organizer"]!.map((x) => x)),
        regLink: json["reg_link"],
      );

  Map<String, dynamic> toJson() => {
        "banner_image": bannerImage,
        "date": date,
        "description": description,
        "doc_id": docId,
        "event_title": eventTitle,
        "organizer": organizer == null
            ? []
            : List<dynamic>.from(organizer!.map((x) => x)),
        "reg_link": regLink,
      };
}
