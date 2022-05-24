// To parse this JSON data, do
//
//     final notes = notesFromMap(jsonString);

import 'dart:convert';

class Notes {
    Notes({
        this.nota,
    });

    Nota? nota;

    factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Notes.fromMap(Map<String, dynamic> json) => Notes(
        nota: Nota.fromMap(json["nota"]),
    );

    Map<String, dynamic> toMap() => {
        "nota": nota?.toMap(),
    };
}

class Nota {
    Nota({
        required this.description,
        required this.title,
        this.id
    });

    String description;
    String title;
    String? id;

    factory Nota.fromJson(String str) => Nota.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Nota.fromMap(Map<String, dynamic> json) => Nota(
        description: json["description"],
        title: json["title"],
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "title": title,
        "id": id,
    };

    Nota copy() => Nota(
      title: this.title,
      description: this.description,
      id: this.id,
    );
}










// // To parse this JSON data, do
// //
// //     final notes = notesFromMap(jsonString);

// import 'dart:convert';

// class Notes {
//     Notes({
//         required this.description,
//          required this.title,
//          this.id
//     });

//     String description;
//     String title;
//     String? id;

//     factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Notes.fromMap(Map<String, dynamic> json) => Notes(
//         description: json["description"],
//         title: json["title"],
//     );

//     Map<String, dynamic> toMap() => {
//         "description": description,
//         "title": title,
//     };

//     Notes copy() => Notes(
//       title: this.title,
//       description: this.description,
//       id: this.id,
//     );
// }
