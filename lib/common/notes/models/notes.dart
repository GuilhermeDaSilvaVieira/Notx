import 'dart:convert';

import 'package:equatable/equatable.dart';

Notes notesFromMap(String str) => Notes.fromMap(json.decode(str));
String notesToMap(Notes data) => json.encode(data.toMap());

class Notes extends Equatable {
  final int? id;
  final String title;
  final String content;
  final String createdAt;
  final String? lastModified;

  const Notes({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.lastModified,
  });

  factory Notes.fromMap(Map<String, dynamic> json) => Notes(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        createdAt: json['createdAt'],
        lastModified: json['lastModified'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'createdAt': createdAt,
        'lastModified': lastModified,
      };

  @override
  List<Object?> get props => [id, title, content, createdAt, lastModified];
}
