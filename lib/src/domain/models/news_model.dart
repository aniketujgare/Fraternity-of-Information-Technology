// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  final String? coverImage;
  final String? newsId;
  final String? newsContent;
  final DateTime? newsDate;
  final String? newsTitle;
  final String? newsWriter;
  final List<String>? subImages;
  final String? subtitle;
  final String? writersDepartment;
  final String? writersYear;

  NewsModel({
    this.coverImage,
    this.newsId,
    this.newsContent,
    this.newsDate,
    this.newsTitle,
    this.newsWriter,
    this.subImages,
    this.subtitle,
    this.writersDepartment,
    this.writersYear,
  });

  NewsModel copyWith({
    String? coverImage,
    String? newsId,
    String? newsContent,
    DateTime? newsDate,
    String? newsTitle,
    String? newsWriter,
    List<String>? subImages,
    String? subtitle,
    String? writersDepartment,
    String? writersYear,
  }) =>
      NewsModel(
        coverImage: coverImage ?? this.coverImage,
        newsId: newsId ?? this.newsId,
        newsContent: newsContent ?? this.newsContent,
        newsDate: newsDate ?? this.newsDate,
        newsTitle: newsTitle ?? this.newsTitle,
        newsWriter: newsWriter ?? this.newsWriter,
        subImages: subImages ?? this.subImages,
        subtitle: subtitle ?? this.subtitle,
        writersDepartment: writersDepartment ?? this.writersDepartment,
        writersYear: writersYear ?? this.writersYear,
      );

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        coverImage: json["cover_image"],
        newsId: json["news_id"],
        newsContent: json["news_content"],
        newsDate: json["news_date"] == null
            ? null
            : DateTime.parse(json["news_date"]),
        newsTitle: json["news_title"],
        newsWriter: json["news_writer"],
        subImages: json["sub_images"] == null
            ? []
            : List<String>.from(json["sub_images"]!.map((x) => x)),
        subtitle: json["subtitle"],
        writersDepartment: json["writers_department"],
        writersYear: json["writers_year"],
      );

  Map<String, dynamic> toJson() => {
        "cover_image": coverImage,
        "news_id": newsId,
        "news_content": newsContent,
        "news_date":
            "${newsDate!.year.toString().padLeft(4, '0')}-${newsDate!.month.toString().padLeft(2, '0')}-${newsDate!.day.toString().padLeft(2, '0')}",
        "news_title": newsTitle,
        "news_writer": newsWriter,
        "sub_images": subImages == null
            ? []
            : List<dynamic>.from(subImages!.map((x) => x)),
        "subtitle": subtitle,
        "writers_department": writersDepartment,
        "writers_year": writersYear,
      };
}
