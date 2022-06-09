// To parse this JSON data, do

import 'dart:convert';

class Notes {
  
    Notes({
        required this.description,
        required this.title,
        this.id,
        required this.idToken
    });

    String description;
    String title;
    String? id;
    String idToken;

    factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Notes.fromMap(Map<String, dynamic> json) => Notes(
        description: json["description"],
        title: json["title"],
        idToken: json['idToken'],
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "title": title,
    };

    Notes copy() => Notes(
      title: this.title,
      description: this.description,
      id: this.id,
      idToken: this.idToken
    );
}