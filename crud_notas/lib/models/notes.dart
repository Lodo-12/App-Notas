// To parse this JSON data, do
//
//     final notes = notesFromMap(jsonString);

import 'dart:convert';

// class Notes {
//     Notes({
//         this.nota1,
//         this.nota2,
//     });

//     Nota nota1;
//     Nota nota2;

//     factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Notes.fromMap(Map<String, dynamic> json) => Notes(
//         nota1: Nota.fromMap(json["nota1"]),
//         nota2: Nota.fromMap(json["nota2"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "nota1": nota1.toMap(),
//         "nota2": nota2.toMap(),
//     };
// }

class Notes {
    Notes({
        required this.description,
        required this.title,
        required this.token,
        this.id
    });

    String description;
    String title;
    String token;
    String? id;

    factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Notes.fromMap(Map<String, dynamic> json) => Notes(
        description: json["description"],
        title: json["title"],
        token: json["token"]
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "title": title,
        "token": token,
    };

    Notes copy() => Notes(
      title: this.title,
      description: this.description,
      id: this.id,
      token: this.token
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
