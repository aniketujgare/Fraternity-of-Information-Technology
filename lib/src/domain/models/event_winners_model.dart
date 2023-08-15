import 'dart:convert';

EventWinnersModel userModelFromJson(String str) =>
    EventWinnersModel.fromJson(json.decode(str));

String userModelToJson(EventWinnersModel data) => json.encode(data.toJson());

class EventWinnersModel {
  final List<Winner>? winners;
  final String? eventDate;
  final List<String>? eventOrganizers;
  final String? eventName;
  final String? docId;

  EventWinnersModel({
    this.winners,
    this.eventDate,
    this.eventOrganizers,
    this.eventName,
    this.docId,
  });

  EventWinnersModel copyWith({
    List<Winner>? winners,
    String? eventDate,
    List<String>? eventOrganizers,
    String? eventName,
    String? docId,
  }) =>
      EventWinnersModel(
        winners: winners ?? this.winners,
        eventDate: eventDate ?? this.eventDate,
        eventOrganizers: eventOrganizers ?? this.eventOrganizers,
        eventName: eventName ?? this.eventName,
        docId: docId ?? this.docId,
      );

  factory EventWinnersModel.fromJson(Map<String, dynamic> json) =>
      EventWinnersModel(
        winners: json["winners"] == null
            ? []
            : List<Winner>.from(
                json["winners"]!.map((x) => Winner.fromJson(x))),
        eventDate: json["event_date"],
        eventOrganizers: json["event_organizers"] == null
            ? []
            : List<String>.from(json["event_organizers"]!.map((x) => x)),
        eventName: json["event_name"],
        docId: json["doc_id"],
      );

  Map<String, dynamic> toJson() => {
        "winners": winners == null
            ? []
            : List<dynamic>.from(winners!.map((x) => x.toJson())),
        "event_date": eventDate,
        "event_organizers": eventOrganizers == null
            ? []
            : List<dynamic>.from(eventOrganizers!.map((x) => x)),
        "event_name": eventName,
        "doc_id": docId,
      };
}

class Winner {
  final String? year;
  final String? name;
  final String? department;

  Winner({
    this.year,
    this.name,
    this.department,
  });

  Winner copyWith({
    String? year,
    String? name,
    String? department,
  }) =>
      Winner(
        year: year ?? this.year,
        name: name ?? this.name,
        department: department ?? this.department,
      );

  factory Winner.fromJson(Map<String, dynamic> json) => Winner(
        year: json["year"],
        name: json["name"],
        department: json["department"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "name": name,
        "department": department,
      };
}
