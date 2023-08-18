// // To parse this JSON data, do
// //
// //     final fitCommittee = fitCommitteeFromJson(jsonString);

// import 'dart:convert';

// FitCommitteeModel fitCommitteeFromJson(String str) =>
//     FitCommitteeModel.fromJson(json.decode(str));

// String fitCommitteeToJson(FitCommitteeModel data) => json.encode(data.toJson());

// class FitCommitteeModel {
//   final String? designation;
//   final String? instagram;
//   final String? linkedin;
//   final String? mail;
//   final String? name;
//   final String? phone;
//   final String? profilePic;

//   FitCommitteeModel({
//     this.designation,
//     this.instagram,
//     this.linkedin,
//     this.mail,
//     this.name,
//     this.phone,
//     this.profilePic,
//   });

//   factory FitCommitteeModel.fromJson(Map<String, dynamic> json) =>
//       FitCommitteeModel(
//         designation: json["designation"],
//         instagram: json["instagram"],
//         linkedin: json["linkedin"],
//         mail: json["mail"],
//         name: json["name"],
//         phone: json["phone"],
//         profilePic: json["profile_pic"],
//       );

//   Map<String, dynamic> toJson() => {
//         "designation": designation,
//         "instagram": instagram,
//         "linkedin": linkedin,
//         "mail": mail,
//         "name": name,
//         "phone": phone,
//         "profile_pic": profilePic,
//       };
// }
