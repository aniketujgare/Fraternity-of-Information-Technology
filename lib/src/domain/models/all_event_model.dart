import 'dart:convert';

AllEventModel allEventModelFromJson(String str) =>
    AllEventModel.fromJson(json.decode(str));

String allEventModelToJson(AllEventModel data) => json.encode(data.toJson());

class AllEventModel {
  final String? date;
  final List<String>? organizers;
  final String? eventTitle;
  final List<String>? eventImages;
  final String? bannerImage;
  final String? description;
  final String? eventType;

  AllEventModel({
    this.date,
    this.organizers,
    this.eventTitle,
    this.eventImages,
    this.bannerImage,
    this.description,
    this.eventType,
  });

  factory AllEventModel.fromJson(Map<String, dynamic> json) => AllEventModel(
        date: json["date"],
        organizers: json["organizers"] == null
            ? []
            : List<String>.from(json["organizers"]!.map((x) => x)),
        eventTitle: json["event_title"],
        eventImages: json["event_images"] == null
            ? []
            : List<String>.from(json["event_images"]!.map((x) => x)),
        bannerImage: json["banner_image"],
        description: json["description"],
        eventType: json["event_type"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "organizers": organizers == null
            ? []
            : List<dynamic>.from(organizers!.map((x) => x)),
        "event_title": eventTitle,
        "event_images": eventImages == null
            ? []
            : List<dynamic>.from(eventImages!.map((x) => x)),
        "banner_image": bannerImage,
        "description": description,
        "event_type": eventType,
      };
}
