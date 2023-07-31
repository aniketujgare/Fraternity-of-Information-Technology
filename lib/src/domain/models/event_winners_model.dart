import 'dart:convert';

EventWinnersModel userModelFromJson(String str) =>
    EventWinnersModel.fromJson(json.decode(str));

String userModelToJson(EventWinnersModel data) => json.encode(data.toJson());

class EventWinnersModel {
  final List<Winner>? winners;
  final String? date;
  final String? organizer;
  final String? eventName;

  EventWinnersModel({
    this.winners,
    this.date,
    this.organizer,
    this.eventName,
  });

  EventWinnersModel copyWith({
    List<Winner>? winners,
    String? date,
    String? organizer,
    String? eventName,
  }) =>
      EventWinnersModel(
        winners: winners ?? this.winners,
        date: date ?? this.date,
        organizer: organizer ?? this.organizer,
        eventName: eventName ?? this.eventName,
      );

  factory EventWinnersModel.fromJson(Map<String, dynamic> json) =>
      EventWinnersModel(
        winners: json["winners"] == null
            ? []
            : List<Winner>.from(
                json["winners"]!.map((x) => Winner.fromJson(x))),
        date: json["date"],
        organizer: json["organizer"],
        eventName: json["event_name"],
      );

  Map<String, dynamic> toJson() => {
        "winners": winners == null
            ? []
            : List<dynamic>.from(winners!.map((x) => x.toJson())),
        "date": date,
        "organizer": organizer,
        "event_name": eventName,
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
