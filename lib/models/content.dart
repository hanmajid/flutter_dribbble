class Content {
  final int id;
  final String profilePicUrl;
  final String title;
  final String artistName;
  final DateTime createdAt;
  final int loveCount;
  final int commentCount;
  final int viewCount;
  final int attachmentCount;

  Content({
    this.id,
    this.profilePicUrl,
    this.title,
    this.artistName,
    this.createdAt,
    this.loveCount,
    this.commentCount,
    this.viewCount,
    this.attachmentCount,
  });
}
