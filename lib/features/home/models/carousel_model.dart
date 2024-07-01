// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarouselModel {
  final int id;
  final String slug;
  final String gambar;
  CarouselModel({
    required this.id,
    required this.slug,
    required this.gambar,
  });

  CarouselModel copyWith({
    int? id,
    String? slug,
    String? gambar,
  }) {
    return CarouselModel(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      gambar: gambar ?? this.gambar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'gambar': gambar,
    };
  }

  factory CarouselModel.fromMap(Map<String, dynamic> map) {
    return CarouselModel(
      id: map['id'] as int,
      slug: map['slug'] as String,
      gambar: map['gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarouselModel.fromJson(String source) =>
      CarouselModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CarouselModel(id: $id, slug: $slug, gambar: $gambar)';

  @override
  bool operator ==(covariant CarouselModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.slug == slug && other.gambar == gambar;
  }

  @override
  int get hashCode => id.hashCode ^ slug.hashCode ^ gambar.hashCode;
}
