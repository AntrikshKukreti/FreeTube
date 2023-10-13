// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  String? kind;
  String? etag;
  String? nextPageToken;
  String? regionCode;
  PageInfo? pageInfo;
  List<Item>? items;

  SearchResponse({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.items,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"],
    regionCode: json["regionCode"],
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "regionCode": regionCode,
    "pageInfo": pageInfo?.toJson(),
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? kind;
  String? etag;
  Id? id;
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
    id: json["id"] == null ? null : Id.fromJson(json["id"]),
    snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id?.toJson(),
    "snippet": snippet?.toJson(),
  };
}

class Id {
  String? kind;
  String? videoId;

  Id({
    this.kind,
    this.videoId,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    kind: json["kind"],
    videoId: json["videoId"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "videoId": videoId,
  };
}

class Snippet {
  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  String? liveBroadcastContent;
  DateTime? publishTime;

  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    liveBroadcastContent: json["liveBroadcastContent"],
    publishTime: json["publishTime"] == null ? null : DateTime.parse(json["publishTime"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt?.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails?.toJson(),
    "channelTitle": channelTitle,
    "liveBroadcastContent": liveBroadcastContent,
    "publishTime": publishTime?.toIso8601String(),
  };
}

class Thumbnails {
  Default? thumbnailsDefault;
  Default? medium;
  Default? high;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: json["default"] == null ? null : Default.fromJson(json["default"]),
    medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
    high: json["high"] == null ? null : Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault?.toJson(),
    "medium": medium?.toJson(),
    "high": high?.toJson(),
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
