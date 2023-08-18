// To parse this JSON data, do
//
//     final extrasModel = extrasModelFromJson(jsonString);

import 'dart:convert';

ExtrasModel extrasModelFromJson(String str) =>
    ExtrasModel.fromJson(json.decode(str));

String extrasModelToJson(ExtrasModel data) => json.encode(data.toJson());

class ExtrasModel {
  final List<Developer>? developers;
  final FitLinks? fitLinks;
  final FitLogo? fitLogo;
  final String? github;
  final String? whatIsFit;

  ExtrasModel({
    this.developers,
    this.fitLinks,
    this.fitLogo,
    this.github,
    this.whatIsFit,
  });

  ExtrasModel copyWith({
    List<Developer>? developers,
    FitLinks? fitLinks,
    FitLogo? fitLogo,
    String? github,
    String? whatIsFit,
  }) =>
      ExtrasModel(
        developers: developers ?? this.developers,
        fitLinks: fitLinks ?? this.fitLinks,
        fitLogo: fitLogo ?? this.fitLogo,
        github: github ?? this.github,
        whatIsFit: whatIsFit ?? this.whatIsFit,
      );

  factory ExtrasModel.fromJson(Map<String, dynamic> json) => ExtrasModel(
        developers: json["developers"] == null
            ? []
            : List<Developer>.from(
                json["developers"]!.map((x) => Developer.fromJson(x))),
        fitLinks: json["fit_links"] == null
            ? null
            : FitLinks.fromJson(json["fit_links"]),
        fitLogo: json["fit_logo"] == null
            ? null
            : FitLogo.fromJson(json["fit_logo"]),
        github: json["github"],
        whatIsFit: json["what_is_fit"],
      );

  Map<String, dynamic> toJson() => {
        "developers": developers == null
            ? []
            : List<dynamic>.from(developers!.map((x) => x.toJson())),
        "fit_links": fitLinks?.toJson(),
        "fit_logo": fitLogo?.toJson(),
        "github": github,
        "what_is_fit": whatIsFit,
      };
}

class Developer {
  final String? contribution;
  final String? description;
  final String? email;
  final String? instagram;
  final String? linkedin;
  final String? name;
  final String? phone;
  final String? picture;

  Developer({
    this.contribution,
    this.description,
    this.email,
    this.instagram,
    this.linkedin,
    this.name,
    this.phone,
    this.picture,
  });

  Developer copyWith({
    String? contribution,
    String? description,
    String? email,
    String? instagram,
    String? linkedin,
    String? name,
    String? phone,
    String? picture,
  }) =>
      Developer(
        contribution: contribution ?? this.contribution,
        description: description ?? this.description,
        email: email ?? this.email,
        instagram: instagram ?? this.instagram,
        linkedin: linkedin ?? this.linkedin,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        picture: picture ?? this.picture,
      );

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        contribution: json["contribution"],
        description: json["description"],
        email: json["email"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
        name: json["name"],
        phone: json["phone"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "contribution": contribution,
        "description": description,
        "email": email,
        "instagram": instagram,
        "linkedin": linkedin,
        "name": name,
        "phone": phone,
        "picture": picture,
      };
}

class FitLinks {
  final String? instagram;
  final String? whatsapp;

  FitLinks({
    this.instagram,
    this.whatsapp,
  });

  FitLinks copyWith({
    String? instagram,
    String? whatsapp,
  }) =>
      FitLinks(
        instagram: instagram ?? this.instagram,
        whatsapp: whatsapp ?? this.whatsapp,
      );

  factory FitLinks.fromJson(Map<String, dynamic> json) => FitLinks(
        instagram: json["instagram"],
        whatsapp: json["whatsapp"],
      );

  Map<String, dynamic> toJson() => {
        "instagram": instagram,
        "whatsapp": whatsapp,
      };
}

class FitLogo {
  final String? jpg;
  final String? png;

  FitLogo({
    this.jpg,
    this.png,
  });

  FitLogo copyWith({
    String? jpg,
    String? png,
  }) =>
      FitLogo(
        jpg: jpg ?? this.jpg,
        png: png ?? this.png,
      );

  factory FitLogo.fromJson(Map<String, dynamic> json) => FitLogo(
        jpg: json["jpg"],
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg,
        "png": png,
      };
}
