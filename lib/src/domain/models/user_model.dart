import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? docID;
  String? name;
  String? phone;
  String? email;
  String? prnNumber;
  String? branch;
  String? year;
  String? admissionYear;
  String? profilePic;

  UserModel({
    this.docID,
    this.name,
    this.phone,
    this.email,
    this.prnNumber,
    this.branch,
    this.year,
    this.admissionYear,
    this.profilePic,
  });

  UserModel copyWith({
    String? docID,
    String? name,
    String? phone,
    String? email,
    String? prnNumber,
    String? branch,
    String? year,
    String? admissionYear,
    String? profilePic,
  }) =>
      UserModel(
        name: name ?? this.name,
        docID: docID ?? this.docID,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        prnNumber: prnNumber ?? this.prnNumber,
        branch: branch ?? this.branch,
        year: year ?? this.year,
        admissionYear: admissionYear ?? this.admissionYear,
        profilePic: profilePic ?? this.profilePic,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        docID: json["doc_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        prnNumber: json["prn_number"],
        branch: json["branch"],
        year: json["year"],
        admissionYear: json["admission_year"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docID,
        "name": name,
        "phone": phone,
        "email": email,
        "prn_number": prnNumber,
        "branch": branch,
        "year": year,
        "admission_year": admissionYear,
        "profile_pic": profilePic,
      };
}
