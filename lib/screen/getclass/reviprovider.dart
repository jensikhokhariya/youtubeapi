import 'dart:convert';

Related welcomeFromJson(String str) => Related.fromJson(json.decode(str));

String welcomeToJson(Related data) => json.encode(data.toJson());

class Related {
  Related({
    this.kind,
    this.etag,
    this.items,
  });

  String? kind;
  String? etag;
  List<Items>? items;

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        kind: json["kind"],
        etag: json["etag"],
        items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Items {
  Items({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  ItemKind? kind;
  String? etag;
  Id? id;
  Snippet? snippet;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        kind: itemKindValues.map![json["kind"]],
        etag: json["etag"],
        id: Id.fromJson(json["id"]),
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": itemKindValues.reverse![kind],
        "etag": etag,
        "id": id?.toJson(),
        "snippet": snippet?.toJson(),
      };
}

class Id {
  Id({
    this.kind,
    this.videoId,
  });

  IdKind? kind;
  String? videoId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: idKindValues.map![json["kind"]],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": idKindValues.reverse![kind],
        "videoId": videoId,
      };
}

enum IdKind { YOUTUBE_VIDEO }

final idKindValues = EnumValues({"youtube#video": IdKind.YOUTUBE_VIDEO});

enum ItemKind { YOUTUBE_SEARCH_RESULT }

final itemKindValues =
    EnumValues({"youtube#searchResult": ItemKind.YOUTUBE_SEARCH_RESULT});

class Snippet {
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

  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  LiveBroadcastContent? liveBroadcastContent;
  DateTime? publishTime;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        liveBroadcastContent:
            liveBroadcastContentValues.map![json["liveBroadcastContent"]],
        publishTime: DateTime.parse(json["publishTime"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toJson(),
        "channelTitle": channelTitle,
        "liveBroadcastContent":
            liveBroadcastContentValues.reverse![liveBroadcastContent],
        "publishTime": publishTime?.toIso8601String(),
      };
}

enum LiveBroadcastContent { NONE }

final liveBroadcastContentValues =
    EnumValues({"none": LiveBroadcastContent.NONE});

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: json["standard"] == null
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
        "standard": standard == null ? null : standard?.toJson(),
        "maxres": maxres == null ? null : maxres?.toJson(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

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

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
