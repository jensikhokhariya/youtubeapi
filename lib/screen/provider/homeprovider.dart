class YouTube {
  List<dynamic>? videos;

  YouTube({this.videos});

  YouTube youTubeFactory(Map map) {
    return YouTube(
      videos: map['videos'].map((e) => Videos().vFactory(e)).toList(),
    );
  }
}

class Videos {
  String? id, chanelId, title;
  int? categoryId,
      viewCount,
      likeCount,
      dislikeCount,
      favoriteCount,
      commentCount;

  Videos(
      {this.id,
      this.chanelId,
      this.title,
      this.categoryId,
      this.viewCount,
      this.likeCount,
      this.dislikeCount,
      this.favoriteCount,
      this.commentCount});

  Videos vFactory(Map map) {
    return Videos(
      id: map['id'],
      viewCount: map['viewCount'],
      likeCount: map['likeCount'],
      favoriteCount: map['favoriteCount'],
      dislikeCount: map['dislikeCount'],
      commentCount: map['commentCount'],
      title: map['title'],
      categoryId: map['categoryId'],
      chanelId: map['chanelId'],
    );
  }
}
