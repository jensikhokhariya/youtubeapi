class Items{
  String? id;
  List<Snippet>? snippet = [];
  List<Statistics>? statistics = [];

  Items({this.id, this.snippet, this.statistics});

  Items Itemfactory(Map map){
    String id = map['id'];

    List l1 = map['snippet'];
    List<Snippet> snList = [];
    List l2 = map['statistics'];
    List<Statistics> stList = [];

    snList = l1.map((e) => Snippet().snippetfactory(e)).toList();

    stList = l2.map((e) => Statistics().statisticsfactory(e)).toList();

    return Items(id: id,snippet: snList,statistics: stList);
  }

}

class Snippet{
  String? channelId,title,categoryId;

  Snippet({this.channelId, this.title, this.categoryId});

  Snippet snippetfactory(Map map){
   String channelId = map['channelId'];
   String title = map['title'];
   String categoryId = map['categoryId'];

   return Snippet(categoryId: categoryId,title: title,channelId: channelId);
  }
}

class Statistics{
  int? viewCount,likeCount,favoriteCount,commentCount;

  Statistics(
      {this.viewCount, this.likeCount, this.favoriteCount, this.commentCount});

  Statistics statisticsfactory(Map map){
    int viewCount = map['viewCount'];
    int likeCount = map['likeCount'];
    int favoriteCount = map['favoriteCount'];
    int commentCount = map['commentCount'];

    return Statistics(viewCount: viewCount,likeCount: likeCount,favoriteCount: favoriteCount,commentCount: commentCount);
  }
}
