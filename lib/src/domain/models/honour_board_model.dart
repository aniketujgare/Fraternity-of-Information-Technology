import 'dart:convert';

HonourBoardModel honourBoardModelFromJson(String str) =>
    HonourBoardModel.fromJson(json.decode(str));

String honourBoardModelToJson(HonourBoardModel data) =>
    json.encode(data.toJson());

class HonourBoardModel {
  final String name;
  final String profilePic;
  final String year;
  final String department;
  final List<String> achievements;

  HonourBoardModel({
    required this.name,
    required this.profilePic,
    required this.achievements,
    required this.year,
    required this.department,
  });

  HonourBoardModel copyWith({
    String? name,
    String? profilePic,
    String? year,
    String? department,
    List<String>? achievements,
  }) =>
      HonourBoardModel(
          name: name ?? this.name,
          profilePic: profilePic ?? this.profilePic,
          achievements: achievements ?? this.achievements,
          year: year ?? this.year,
          department: department ?? this.department);

  factory HonourBoardModel.fromJson(Map<String, dynamic> json) =>
      HonourBoardModel(
        name: json["name"],
        profilePic: json["profile_pic"],
        achievements: List<String>.from(json["achievements"].map((x) => x)),
        year: json["year"],
        department: json["department"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_pic": profilePic,
        "achievements": List<dynamic>.from(achievements.map((x) => x)),
        "year": year,
        "department": department,
      };
}
