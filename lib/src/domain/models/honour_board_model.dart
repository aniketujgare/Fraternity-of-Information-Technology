import 'dart:convert';

HonourBoardModel honourBoardModelFromJson(String str) =>
    HonourBoardModel.fromJson(json.decode(str));

String honourBoardModelToJson(HonourBoardModel data) =>
    json.encode(data.toJson());

class HonourBoardModel {
  final String name;
  final String profilePic;
  final List<String> achievements;

  HonourBoardModel({
    required this.name,
    required this.profilePic,
    required this.achievements,
  });

  HonourBoardModel copyWith({
    String? name,
    String? profilePic,
    List<String>? achievements,
  }) =>
      HonourBoardModel(
        name: name ?? this.name,
        profilePic: profilePic ?? this.profilePic,
        achievements: achievements ?? this.achievements,
      );

  factory HonourBoardModel.fromJson(Map<String, dynamic> json) =>
      HonourBoardModel(
        name: json["name"],
        profilePic: json["profile_pic"],
        achievements: List<String>.from(json["achievements"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_pic": profilePic,
        "achievements": List<dynamic>.from(achievements.map((x) => x)),
      };
}
