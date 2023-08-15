import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? userId;
  String? name;
  String? phone;
  String? email;
  String? prnNumber;
  String? branch;
  String? year;
  String? admissionYear;
  String? profilePic;
  String? dateOfCreation;

  UserModel({
    this.userId,
    this.name,
    this.phone,
    this.email,
    this.prnNumber,
    this.branch,
    this.year,
    this.admissionYear,
    this.profilePic,
    this.dateOfCreation,
  });

  UserModel copyWith({
    String? userId,
    String? name,
    String? phone,
    String? email,
    String? prnNumber,
    String? branch,
    String? year,
    String? admissionYear,
    String? profilePic,
    String? dateOfCreation,
  }) =>
      UserModel(
        name: name ?? this.name,
        userId: userId ?? this.userId,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        prnNumber: prnNumber ?? this.prnNumber,
        branch: branch ?? this.branch,
        year: year ?? this.year,
        admissionYear: admissionYear ?? this.admissionYear,
        profilePic: profilePic ?? this.profilePic,
        dateOfCreation: dateOfCreation ?? this.dateOfCreation,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        prnNumber: json["prn_number"],
        branch: json["branch"],
        year: json["year"],
        admissionYear: json["admission_year"],
        profilePic: json["profile_pic"],
        dateOfCreation: json["date_of_creation"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "phone": phone,
        "email": email,
        "prn_number": prnNumber,
        "branch": branch,
        "year": year,
        "admission_year": admissionYear,
        "profile_pic": profilePic,
        "date_of_creation": dateOfCreation,
      };
}
