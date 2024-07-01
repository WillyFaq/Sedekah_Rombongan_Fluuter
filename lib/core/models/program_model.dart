// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProgramModel {
  final int id;
  final String judul;
  final String slug;
  final String gambar;
  final String lokasi;
  final int targetDana;
  final DateTime tglMulai;
  final String kategori;
  final int donasi;
  final int jumlah;
  final String idrTarget;
  final String idrJumlah;
  final String deskripsi;
  final List<String> donatur;
  ProgramModel({
    required this.id,
    required this.judul,
    required this.slug,
    required this.gambar,
    required this.lokasi,
    required this.targetDana,
    required this.tglMulai,
    required this.kategori,
    required this.donasi,
    required this.jumlah,
    required this.idrTarget,
    required this.idrJumlah,
    required this.deskripsi,
    required this.donatur,
  });

  ProgramModel copyWith({
    int? id,
    String? judul,
    String? slug,
    String? gambar,
    String? lokasi,
    int? targetDana,
    DateTime? tglMulai,
    String? kategori,
    int? donasi,
    int? jumlah,
    String? idrTarget,
    String? idrJumlah,
    String? deskripsi,
    List<String>? donatur,
  }) {
    return ProgramModel(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      slug: slug ?? this.slug,
      gambar: gambar ?? this.gambar,
      lokasi: lokasi ?? this.lokasi,
      targetDana: targetDana ?? this.targetDana,
      tglMulai: tglMulai ?? this.tglMulai,
      kategori: kategori ?? this.kategori,
      donasi: donasi ?? this.donasi,
      jumlah: jumlah ?? this.jumlah,
      idrTarget: idrTarget ?? this.idrTarget,
      idrJumlah: idrJumlah ?? this.idrJumlah,
      deskripsi: deskripsi ?? this.deskripsi,
      donatur: donatur ?? this.donatur,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'judul': judul,
      'slug': slug,
      'gambar': gambar,
      'lokasi': lokasi,
      'targetDana': targetDana,
      'tglMulai': tglMulai.millisecondsSinceEpoch,
      'kategori': kategori,
      'donasi': donasi,
      'jumlah': jumlah,
      'idrTarget': idrTarget,
      'idrJumlah': idrJumlah,
      'deskripsi': deskripsi,
      'donatur': donatur,
    };
  }

  factory ProgramModel.fromMap(Map<String, dynamic> map) {
    return ProgramModel(
      id: map['id'] ?? 0,
      judul: map['judul'] ?? "",
      slug: map['slug'] ?? "",
      gambar: map['gambar'] ?? "",
      lokasi: map['lokasi'] ?? "",
      // targetDana: BigInt.fromMap(map['targetDana'] as Map<String,dynamic>),
      targetDana: map['target_dana'] ?? 0,
      tglMulai: DateTime.parse(map['tgl_mulai'] as String),
      kategori: map['kategori'] ?? "",
      donasi: map['donasi'] ?? 0,
      // jumlah: BigInt.fromMap(map['jumlah'] as Map<String,dynamic>),
      jumlah: map['jumlah'] ?? 0,
      idrTarget: map['idr_target'] ?? "",
      idrJumlah: map['idr_jumlah'] ?? "",
      deskripsi: map['deskripsi'] ?? "",
      donatur: List<String>.from((map['donatur'] as List<dynamic>)),
      // donatur: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramModel.fromJson(String source) =>
      ProgramModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProgramModel(id: $id, judul: $judul, slug: $slug, gambar: $gambar, lokasi: $lokasi, targetDana: $targetDana, tglMulai: $tglMulai, kategori: $kategori, donasi: $donasi, jumlah: $jumlah, idrTarget: $idrTarget, idrJumlah: $idrJumlah, deskripsi: $deskripsi, donatur: $donatur)';
  }

  @override
  bool operator ==(covariant ProgramModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.judul == judul &&
        other.slug == slug &&
        other.gambar == gambar &&
        other.lokasi == lokasi &&
        other.targetDana == targetDana &&
        other.tglMulai == tglMulai &&
        other.kategori == kategori &&
        other.donasi == donasi &&
        other.jumlah == jumlah &&
        other.idrTarget == idrTarget &&
        other.idrJumlah == idrJumlah &&
        other.deskripsi == deskripsi &&
        listEquals(other.donatur, donatur);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        judul.hashCode ^
        slug.hashCode ^
        gambar.hashCode ^
        lokasi.hashCode ^
        targetDana.hashCode ^
        tglMulai.hashCode ^
        kategori.hashCode ^
        donasi.hashCode ^
        jumlah.hashCode ^
        idrTarget.hashCode ^
        idrJumlah.hashCode ^
        deskripsi.hashCode ^
        donatur.hashCode;
  }
}
