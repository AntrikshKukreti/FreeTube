// To parse this JSON data, do
//
//     final videosResponse = videosResponseFromJson(jsonString);

import 'dart:convert';

VideosResponse videosResponseFromJson(String str) => VideosResponse.fromJson(json.decode(str));

String videosResponseToJson(VideosResponse data) => json.encode(data.toJson());

class VideosResponse {
  String? kind;
  String? etag;
  List<Item>? items;
  String? nextPageToken;
  PageInfo? pageInfo;

  VideosResponse({
    this.kind,
    this.etag,
    this.items,
    this.nextPageToken,
    this.pageInfo,
  });

  factory VideosResponse.fromJson(Map<String, dynamic> json) => VideosResponse(
    kind: json["kind"],
    etag: json["etag"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    nextPageToken: json["nextPageToken"],
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "nextPageToken": nextPageToken,
    "pageInfo": pageInfo?.toJson(),
  };
}

class Item {
  String? kind;
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
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id,
    "snippet": snippet?.toJson(),
  };
}

class Snippet {
  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  List<String>? tags;
  String? categoryId;
  String? liveBroadcastContent;
  Localized? localized;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.tags,
    this.categoryId,
    this.liveBroadcastContent,
    this.localized,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    categoryId: json["categoryId"],
    liveBroadcastContent: json["liveBroadcastContent"],
    localized: json["localized"] == null ? null : Localized.fromJson(json["localized"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt?.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails?.toJson(),
    "channelTitle": channelTitle,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "categoryId": categoryId,
    "liveBroadcastContent": liveBroadcastContent,
    "localized": localized?.toJson(),
  };
}

class Localized {
  String? title;
  String? description;

  Localized({
    this.title,
    this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class Thumbnails {
  Default? thumbnailsDefault;
  Default? medium;
  Default? high;
  Default? standard;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: json["default"] == null ? null : Default.fromJson(json["default"]),
    medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
    high: json["high"] == null ? null : Default.fromJson(json["high"]),
    standard: json["standard"] == null ? null : Default.fromJson(json["standard"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault?.toJson(),
    "medium": medium?.toJson(),
    "high": high?.toJson(),
    "standard": standard?.toJson(),
  };
}

class Default {
  String? url;
  int? width;
  int? height;

  Default({
    this.url,
    this.width,
    this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class PageInfo {
  int? totalResults;
  int? resultsPerPage;

  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}
