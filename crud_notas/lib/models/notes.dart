// To parse this JSON data, do
//
//     final notes = notesFromMap(jsonString);

import 'dart:convert';

class Notes {
    Notes({
        required this.description,
        required this.title,
        this.id,
        required this.userid
    });

    String description;
    String title;
    String? id;
    String userid;

    factory Notes.fromJson(String str) => Notes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Notes.fromMap(Map<String, dynamic> json) => Notes(
        description: json["description"],
        title: json["title"], 
        userid: json["userid"],
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "title": title,
        "userid": userid
    };

    Notes copy() => Notes(
      title: this.title,
      description: this.description,
      id: this.id,
      userid: this.userid,
    );
}

// class Notes {
//     Notes({
//         required this.description,
//         required this.title,
//         this.id
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
