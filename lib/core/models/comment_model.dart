// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommentModel {
  final int id;
  final String isiKomentar;
  final String user;
  final int amin;
  final DateTime createdAt;
  final String waktu;
  CommentModel({
    required this.id,
    required this.isiKomentar,
    required this.user,
    required this.amin,
    required this.createdAt,
    required this.waktu,
  });

  CommentModel copyWith({
    int? id,
    String? isiKomentar,
    String? user,
    int? amin,
    DateTime? createdAt,
    String? waktu,
  }) {
    return CommentModel(
      id: id ?? this.id,
      isiKomentar: isiKomentar ?? this.isiKomentar,
      user: user ?? this.user,
      amin: amin ?? this.amin,
      createdAt: createdAt ?? this.createdAt,
      waktu: waktu ?? this.waktu,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isiKomentar': isiKomentar,
      'user': user,
      'amin': amin,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'waktu': waktu,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] ?? 0,
      isiKomentar: map['isi_komentar'] ?? "",
      user: map['user'] ?? "",
      amin: map['amin'] ?? 0,
      // createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      createdAt: DateTime.parse(map['created_at'] as String),
      waktu: map['waktu'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, isiKomentar: $isiKomentar, user: $user, amin: $amin, createdAt: $createdAt, waktu: $waktu)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.isiKomentar == isiKomentar &&
        other.user == user &&
        other.amin == amin &&
        other.createdAt == createdAt &&
        other.waktu == waktu;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isiKomentar.hashCode ^
        user.hashCode ^
        amin.hashCode ^
        createdAt.hashCode ^
        waktu.hashCode;
  }
}
