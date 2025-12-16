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
    required this.id,
    required this.profilePicUrl,
    required this.title,
    required this.artistName,
    required this.createdAt,
    required this.loveCount,
    required this.commentCount,
    required this.viewCount,
    required this.attachmentCount,
  });
}
