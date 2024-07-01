// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DonationModel {
  final int id;
  final String program;
  final String programSlug;
  final String user;
  final int jumlah;
  final String idrJumlah;
  final DateTime createdAt;
  final String waktu;
  DonationModel({
    required this.id,
    required this.program,
    required this.programSlug,
    required this.user,
    required this.jumlah,
    required this.idrJumlah,
    required this.createdAt,
    required this.waktu,
  });

  DonationModel copyWith({
    int? id,
    String? program,
    String? programSlug,
    String? user,
    int? jumlah,
    String? idrJumlah,
    DateTime? createdAt,
    String? waktu,
  }) {
    return DonationModel(
      id: id ?? this.id,
      program: program ?? this.program,
      programSlug: programSlug ?? this.programSlug,
      user: user ?? this.user,
      jumlah: jumlah ?? this.jumlah,
      idrJumlah: idrJumlah ?? this.idrJumlah,
      createdAt: createdAt ?? this.createdAt,
      waktu: waktu ?? this.waktu,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'program': program,
      'programSlug': programSlug,
      'user': user,
      'jumlah': jumlah,
      'idrJumlah': idrJumlah,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'waktu': waktu,
    };
  }

  factory DonationModel.fromMap(Map<String, dynamic> map) {
    return DonationModel(
      id: map['id'] ?? 0,
      program: map['project'] ?? "",
      programSlug: map['project_slug'] ?? "",
      user: map['user'] ?? "",
      jumlah: map['jumlah'] ?? 0,
      idrJumlah: map['idr_jumlah'] ?? "",
      // createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      createdAt: DateTime.parse(map['created_at'] as String),
      waktu: map['waktu'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory DonationModel.fromJson(String source) =>
      DonationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DonationModel(id: $id, program: $program, programSlug: $programSlug, user: $user, jumlah: $jumlah, idrJumlah: $idrJumlah, createdAt: $createdAt, waktu: $waktu)';
  }

  @override
  bool operator ==(covariant DonationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.program == program &&
        other.programSlug == programSlug &&
        other.user == user &&
        other.jumlah == jumlah &&
        other.idrJumlah == idrJumlah &&
        other.createdAt == createdAt &&
        other.waktu == waktu;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        program.hashCode ^
        programSlug.hashCode ^
        user.hashCode ^
        jumlah.hashCode ^
        idrJumlah.hashCode ^
        createdAt.hashCode ^
        waktu.hashCode;
  }
}
