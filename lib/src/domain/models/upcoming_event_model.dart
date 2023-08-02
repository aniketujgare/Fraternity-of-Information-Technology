import 'dart:convert';

UpcomingEventModel upcomingEventModelFromJson(String str) =>
    UpcomingEventModel.fromJson(json.decode(str));

String upcomingEventModelToJson(UpcomingEventModel data) =>
    json.encode(data.toJson());

class UpcomingEventModel {
  final String date;
  final List<String> organizer;
  final String eventTitle;
  final String regLink;

  UpcomingEventModel({
    required this.date,
    required this.organizer,
    required this.eventTitle,
    required this.regLink,
  });

  factory UpcomingEventModel.fromJson(Map<String, dynamic> json) =>
      UpcomingEventModel(
        date: json["date"],
        organizer: List<String>.from(json["organizer"].map((x) => x)),
        eventTitle: json["event_title"],
        regLink: json["reg_link"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "organizer": List<dynamic>.from(organizer.map((x) => x)),
        "event_title": eventTitle,
        "reg_link": regLink,
      };
}
