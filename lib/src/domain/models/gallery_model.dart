import 'dart:convert';

GalleryModel galleryModelFromJson(String str) =>
    GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
  final String? date;
  final List<String>? images;
  final String? keyDate;

  GalleryModel({
    this.date,
    this.images,
    this.keyDate,
  });

  GalleryModel copyWith({
    String? date,
    List<String>? images,
    String? keyDate,
  }) =>
      GalleryModel(
        date: date ?? this.date,
        images: images ?? this.images,
        keyDate: keyDate ?? this.keyDate,
      );

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        date: json["date"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        keyDate: json["key_date"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "key_date": keyDate,
      };
}
