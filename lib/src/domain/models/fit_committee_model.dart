import 'dart:convert';

FITCommitteeModel fitCommitteeModelFromJson(String str) =>
    FITCommitteeModel.fromJson(json.decode(str));

String fitCommitteeModelToJson(FITCommitteeModel data) =>
    json.encode(data.toJson());

class FITCommitteeModel {
  String activeYear;
  List<Member> members;

  FITCommitteeModel({
    required this.activeYear,
    required this.members,
  });

  factory FITCommitteeModel.fromJson(Map<String, dynamic> json) =>
      FITCommitteeModel(
        activeYear: json["active_year"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "active_year": activeYear,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
      };
}

class Member {
  String designation;
  String instagram;
  String linkedin;
  String mail;
  String name;
  String phone;
  String profilePic;

  Member({
    required this.designation,
    required this.instagram,
    required this.linkedin,
    required this.mail,
    required this.name,
    required this.phone,
    required this.profilePic,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        designation: json["designation"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
        mail: json["mail"],
        name: json["name"],
        phone: json["phone"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "designation": designation,
        "instagram": instagram,
        "linkedin": linkedin,
        "mail": mail,
        "name": name,
        "phone": phone,
        "profile_pic": profilePic,
      };
}
