// To parse this JSON data, do
//
//     final streamingItem = streamingItemFromMap(jsonString);

import 'dart:convert';

import 'package:janus_client/JanusClient.dart';

List<StreamingItem> streamingItemFromMap(String str) => List<StreamingItem>.from(json.decode(str).map((x) => StreamingItem.fromMap(x)));

String streamingItemToMap(List<StreamingItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class StreamingItem {
  StreamingItem({
    required this.id,
    required this.type,
    required this.description,
    required this.metadata,
    required this.enabled,
    required this.media,
  });

  int id;
  String type;
  String description;
  String metadata;
  bool enabled;
  List<Media> media;

  StreamingItem copyWith({
    int? id,
    String? type,
    String? description,
    String? metadata,
    bool? enabled,
    List<Media>? media,
  }) =>
      StreamingItem(
        id: id ?? this.id,
        type: type ?? this.type,
        description: description ?? this.description,
        metadata: metadata ?? this.metadata,
        enabled: enabled ?? this.enabled,
        media: media ?? this.media,
      );

  factory StreamingItem.fromMap(Map<String, dynamic> json) => StreamingItem(
    id: json["id"],
    type: json["type"],
    description: json["description"],
    metadata: json["metadata"],
    enabled: json["enabled"],
    media: json["media"] == null ? [] : (json["media"] as List).map((x) => Media.fromMap(x)).toList(),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "description": description,
    "metadata": metadata,
    "enabled": enabled,
    "media": media == null ? null : List<dynamic>.from(media.map((x) => x.toMap())),
  };
}

class Media {
  Media({
    required this.mid,
    required this.type,
    required this.label,
    required this.ageMs,
  });

  String mid;
  String type;
  String label;
  int ageMs;

  Media copyWith({
    String? mid,
    String? type,
    String? label,
    int? ageMs,
  }) =>
      Media(
        mid: mid ?? this.mid,
        type: type ?? this.type,
        label: label ?? this.label,
        ageMs: ageMs ?? this.ageMs,
      );

  factory Media.fromMap(Map<String, dynamic> json) => Media(
    mid: json["mid"],
    type: json["type"],
    label: json["label"],
    ageMs: json["age_ms"],
  );

  Map<String, dynamic> toMap() => {
    "mid": mid,
    "type": type,
    "label": label,
    "age_ms": ageMs,
  };
}
