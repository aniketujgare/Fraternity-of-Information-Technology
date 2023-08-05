// To parse this JSON data, do
//
//     final eventRegistrationModel = eventRegistrationModelFromJson(jsonString);

import 'dart:convert';

EventRegistrationModel eventRegistrationModelFromJson(String str) =>
    EventRegistrationModel.fromJson(json.decode(str));

String eventRegistrationModelToJson(EventRegistrationModel data) =>
    json.encode(data.toJson());

class EventRegistrationModel {
  final String? date;
  final String? organizer;
  final List<RegisteredCandidate>? registeredCandidates;
  final String? eventName;

  EventRegistrationModel({
    this.date,
    this.organizer,
    this.registeredCandidates,
    this.eventName,
  });

  EventRegistrationModel copyWith({
    String? date,
    String? organizer,
    List<RegisteredCandidate>? registeredCandidates,
    String? eventName,
  }) =>
      EventRegistrationModel(
        date: date ?? this.date,
        organizer: organizer ?? this.organizer,
        registeredCandidates: registeredCandidates ?? this.registeredCandidates,
        eventName: eventName ?? this.eventName,
      );

  factory EventRegistrationModel.fromJson(Map<String, dynamic> json) =>
      EventRegistrationModel(
        date: json["date"],
        organizer: json["organizer"],
        registeredCandidates: json["registered_candidates"] == null
            ? []
            : List<RegisteredCandidate>.from(json["registered_candidates"]!
                .map((x) => RegisteredCandidate.fromJson(x))),
        eventName: json["event_name"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "organizer": organizer,
        "registered_candidates": registeredCandidates == null
            ? []
            : List<dynamic>.from(registeredCandidates!.map((x) => x.toJson())),
        "event_name": eventName,
      };
}

class RegisteredCandidate {
  final String? phone;
  final String? name;

  RegisteredCandidate({
    this.phone,
    this.name,
  });

  RegisteredCandidate copyWith({
    String? phone,
    String? name,
  }) =>
      RegisteredCandidate(
        phone: phone ?? this.phone,
        name: name ?? this.name,
      );

  factory RegisteredCandidate.fromJson(Map<String, dynamic> json) =>
      RegisteredCandidate(
        phone: json["phone"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "name": name,
      };
}
