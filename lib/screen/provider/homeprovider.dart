class YouTube {
  List? video;

  YouTube({this.video});

  YouTube youTubeFactory(Map map) {
    return YouTube(
      video: map['video'].map((e) => Videos().vFactory(e)).toList(),
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
      title: map['title'],
      categoryId: map['categoryId'],
      chanelId: map['chanelId'],
      viewCount: map['viewCount'],
      likeCount: map['likeCount'],
      favoriteCount: map['favoriteCount'],
      dislikeCount: map['dislikeCount'],
      commentCount: map['commentCount'],
    );
  }
}
