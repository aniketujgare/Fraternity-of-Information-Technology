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
  final String? newsDate;
  final String? newsTitle;
  final String? newsWritersName;
  final String? newsWritersPicture;
  final List<String>? subImages;
  final String? writersDepartment;
  final String? writersYear;

  NewsModel({
    this.coverImage,
    this.newsId,
    this.newsContent,
    this.newsDate,
    this.newsTitle,
    this.newsWritersName,
    this.newsWritersPicture,
    this.subImages,
    this.writersDepartment,
    this.writersYear,
  });

  NewsModel copyWith({
    String? coverImage,
    String? newsId,
    String? newsContent,
    String? newsDate,
    String? newsTitle,
    String? newsWritersName,
    String? newsWritersPicture,
    List<String>? subImages,
    String? writersDepartment,
    String? writersYear,
  }) =>
      NewsModel(
        coverImage: coverImage ?? this.coverImage,
        newsId: newsId ?? this.newsId,
        newsContent: newsContent ?? this.newsContent,
        newsDate: newsDate ?? this.newsDate,
        newsTitle: newsTitle ?? this.newsTitle,
        newsWritersName: newsWritersName ?? this.newsWritersName,
        newsWritersPicture: newsWritersPicture ?? this.newsWritersPicture,
        subImages: subImages ?? this.subImages,
        writersDepartment: writersDepartment ?? this.writersDepartment,
        writersYear: writersYear ?? this.writersYear,
      );

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        coverImage: json["cover_image"],
        newsId: json["news_id"],
        newsContent: json["news_content"],
        newsDate: json["news_date"],
        newsTitle: json["news_title"],
        newsWritersName: json["news_writers_name"],
        newsWritersPicture: json["news_writers_picture"],
        subImages: json["sub_images"] == null
            ? []
            : List<String>.from(json["sub_images"]!.map((x) => x)),
        writersDepartment: json["writers_department"],
        writersYear: json["writers_year"],
      );

  Map<String, dynamic> toJson() => {
        "cover_image": coverImage,
        "news_id": newsId,
        "news_content": newsContent,
        "news_date": newsDate,
        "news_title": newsTitle,
        "news_writers_name": newsWritersName,
        "news_writers_picture": newsWritersPicture,
        "sub_images": subImages == null
            ? []
            : List<dynamic>.from(subImages!.map((x) => x)),
        "writers_department": writersDepartment,
        "writers_year": writersYear,
      };
}
