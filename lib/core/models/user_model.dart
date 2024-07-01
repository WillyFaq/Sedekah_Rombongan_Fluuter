// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id;
  final String nama;
  final String email;
  final String nomorTelepon;
  final String alamat;
  final String token;
  final int jumlahDonasi;
  final int totalDonasi;
  final String idrTotalDonasi;
  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.nomorTelepon,
    required this.alamat,
    required this.token,
    required this.jumlahDonasi,
    required this.totalDonasi,
    required this.idrTotalDonasi,
  });

  UserModel copyWith({
    int? id,
    String? nama,
    String? email,
    String? nomorTelepon,
    String? alamat,
    String? token,
    int? jumlahDonasi,
    int? totalDonasi,
    String? idrTotalDonasi,
  }) {
    return UserModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      nomorTelepon: nomorTelepon ?? this.nomorTelepon,
      alamat: alamat ?? this.alamat,
      token: token ?? this.token,
      jumlahDonasi: jumlahDonasi ?? this.jumlahDonasi,
      totalDonasi: totalDonasi ?? this.totalDonasi,
      idrTotalDonasi: idrTotalDonasi ?? this.idrTotalDonasi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'nomorTelepon': nomorTelepon,
      'alamat': alamat,
      'token': token,
      'jumlahDonasi': jumlahDonasi,
      'totalDonasi': totalDonasi,
      'idrTotalDonasi': idrTotalDonasi,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? 0,
      nama: map['nama'] ?? "",
      email: map['email'] ?? "",
      nomorTelepon: map['nomor_telepon'] ?? "",
      alamat: map['alamat'] ?? "",
      token: map['remember_token'] ?? "",
      jumlahDonasi: map['jumlah_donasi'] ?? 0,
      totalDonasi: map['nominal_donasi'] ?? 0,
      idrTotalDonasi: map['idr_nominal_donasi'] ?? "Rp. 0",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, nama: $nama, email: $email, nomorTelepon: $nomorTelepon, alamat: $alamat, token: $token, jumlahDonasi: $jumlahDonasi, totalDonasi: $totalDonasi, idrTotalDonasi: $idrTotalDonasi)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nama == nama &&
        other.email == email &&
        other.nomorTelepon == nomorTelepon &&
        other.alamat == alamat &&
        other.token == token &&
        other.jumlahDonasi == jumlahDonasi &&
        other.totalDonasi == totalDonasi &&
        other.idrTotalDonasi == idrTotalDonasi;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nama.hashCode ^
        email.hashCode ^
        nomorTelepon.hashCode ^
        alamat.hashCode ^
        token.hashCode ^
        jumlahDonasi.hashCode ^
        totalDonasi.hashCode ^
        idrTotalDonasi.hashCode;
  }
}
