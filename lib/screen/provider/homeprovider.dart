import 'dart:convert';

YouTube welcomeFromJson(String str) => YouTube.fromJson(json.decode(str));

String welcomeToJson(YouTube data) => json.encode(data.toJson());

class YouTube {
  YouTube({
    this.video,
  });

  List<Item>? video;

  factory YouTube.fromJson(Map<String, dynamic> json) => YouTube(
    video: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(video!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.snippet,
    this.statistics,
  });

  String? id;
  Snippet? snippet;
  Statistics? statistics;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    snippet: Snippet.fromJson(json["snippet"]),
    statistics: Statistics.fromJson(json["statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "snippet": snippet!.toJson(),
    "statistics": statistics!.toJson(),
  };
}

class Snippet {
  Snippet({
    this.channelId,
    this.title,
    this.categoryId,
  });

  String? channelId;
  String? title;
  String? categoryId;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    channelId: json["channelId"],
    title: json["title"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "channelId": channelId,
    "title": title,
    "categoryId": categoryId,
  };
}

class Statistics {
  Statistics({
    this.viewCount,
    this.likeCount,
    this.favoriteCount,
    this.commentCount,
    // this.dislikeCount,
  });

  String? viewCount;
  String? likeCount;
  String? favoriteCount;
  String? commentCount;
  // String? dislikeCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    viewCount: json["viewCount"],
    likeCount: json["likeCount"],
    favoriteCount: json["favoriteCount"],
    commentCount: json["commentCount"],
      // dislikeCount: json["dislikeCount"]
  );

  Map<String, dynamic> toJson() => {
    "viewCount": viewCount,
    "likeCount": likeCount,
    "favoriteCount": favoriteCount,
    "commentCount": commentCount,
    // "dislikeCount":dislikeCount,
  };
}
