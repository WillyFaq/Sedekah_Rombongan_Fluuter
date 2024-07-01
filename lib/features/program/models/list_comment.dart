// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:sedekah_rombongan_flutter/core/models/comment_model.dart';

class ListComment {
  final List<CommentModel> data;
  final Map<String, dynamic> links;
  final Map<String, dynamic> meta;
  ListComment({
    required this.data,
    required this.links,
    required this.meta,
  });

  ListComment copyWith({
    List<CommentModel>? data,
    Map<String, dynamic>? links,
    Map<String, dynamic>? meta,
  }) {
    return ListComment(
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

  factory ListComment.fromMap(Map<String, dynamic> map) {
    return ListComment(
      data: List<CommentModel>.from(
        (map['data'] as List<dynamic>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      links: Map<String, dynamic>.from((map['links'] as Map<String, dynamic>)),
      meta: Map<String, dynamic>.from((map['meta'] as Map<String, dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListComment.fromJson(String source) =>
      ListComment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ListComment(data: $data, links: $links, meta: $meta)';

  @override
  bool operator ==(covariant ListComment other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data) &&
        mapEquals(other.links, links) &&
        mapEquals(other.meta, meta);
  }

  @override
  int get hashCode => data.hashCode ^ links.hashCode ^ meta.hashCode;
}
