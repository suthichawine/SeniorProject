// To parse this JSON data, do
//
//     final faculty = facultyFromJson(jsonString);

import 'dart:convert';

List<Faculty> facultyFromJson(String str) =>
    List<Faculty>.from(json.decode(str).map((x) => Faculty.fromJson(x)));

String facultyToJson(List<Faculty> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faculty {
  String id;
  String department;

  Faculty({
    required this.id,
    required this.department,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
        id: json["id"],
        department: json["department"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "department": department,
      };
}
