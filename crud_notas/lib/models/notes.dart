// To parse this JSON data, do
//
//     final notes = notesFromMap(jsonString);

import 'dart:convert';

class Notes {
    Notes({
        required this.description,
        required this.title,
    });

    String description;
    String title;

    factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Notes.fromMap(Map<String, dynamic> json) => Notes(
        description: json["description"],
        title: json["title"],
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "title": title,
    };
}
