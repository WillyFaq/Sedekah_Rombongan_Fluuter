// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:sedekah_rombongan_flutter/core/models/donation_model.dart';

class ListUserDonasi {
  final List<DonationModel> data;
  final Map<String, dynamic> links;
  final Map<String, dynamic> meta;
  ListUserDonasi({
    required this.data,
    required this.links,
    required this.meta,
  });

  ListUserDonasi copyWith({
    List<DonationModel>? data,
    Map<String, dynamic>? links,
    Map<String, dynamic>? meta,
  }) {
    return ListUserDonasi(
      data: data ?? this.data,
      links: links ?? this.links,
      meta: meta ?? this.meta,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
      'links': links,
      'meta': meta,
    };
  }

  factory ListUserDonasi.fromMap(Map<String, dynamic> map) {
    return ListUserDonasi(
      data: List<DonationModel>.from(
        (map['data'] as List<dynamic>).map<DonationModel>(
          (x) => DonationModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      links: Map<String, dynamic>.from((map['links'] as Map<String, dynamic>)),
      meta: Map<String, dynamic>.from((map['meta'] as Map<String, dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListUserDonasi.fromJson(String source) =>
      ListUserDonasi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ListUserDonasi(data: $data, links: $links, meta: $meta)';

  @override
  bool operator ==(covariant ListUserDonasi other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data) &&
        mapEquals(other.links, links) &&
        mapEquals(other.meta, meta);
  }

  @override
  int get hashCode => data.hashCode ^ links.hashCode ^ meta.hashCode;
}
