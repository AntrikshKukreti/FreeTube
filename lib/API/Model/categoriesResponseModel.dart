// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) => json.encode(data.toJson());

class CategoriesResponse {
  String? kind;
  String? etag;
  List<Item>? items;

  CategoriesResponse({
    this.kind,
    this.etag,
    this.items,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    kind: json["kind"],
    etag: json["etag"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Kind? kind;
  String? etag;
  String? id;
  Snippet? snippet;

  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: kindValues.map[json["kind"]]!,
    etag: json["etag"],
    id: json["id"],
    snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kindValues.reverse[kind],
    "etag": etag,
    "id": id,
    "snippet": snippet?.toJson(),
  };
}

enum Kind {
  YOUTUBE_VIDEO_CATEGORY
}

final kindValues = EnumValues({
  "youtube#videoCategory": Kind.YOUTUBE_VIDEO_CATEGORY
});

class Snippet {
  String? title;
  bool? assignable;
  ChannelId? channelId;

  Snippet({
    this.title,
    this.assignable,
    this.channelId,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    title: json["title"],
    assignable: json["assignable"],
    channelId: channelIdValues.map[json["channelId"]]!,
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "assignable": assignable,
    "channelId": channelIdValues.reverse[channelId],
  };
}

enum ChannelId {
  UCBR8_60_B28_HP2_BM_D_PDNTC_Q
}

final channelIdValues = EnumValues({
  "UCBR8-60-B28hp2BmDPdntcQ": ChannelId.UCBR8_60_B28_HP2_BM_D_PDNTC_Q
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
