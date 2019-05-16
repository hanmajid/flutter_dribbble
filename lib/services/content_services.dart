import 'package:flutter_dribbble/models/content.dart';

class ContentService {
  static Future<List<Content>> getPopulars() async {
    return Future.delayed(Duration(seconds: 4), () {
      return List.generate(10, (int index) {
        return Content(
          id: index,
          profilePicUrl:
              'https://api.adorable.io/avatars/285/circle@adorable.png',
          title: 'Content $index',
          artistName: 'Artist $index',
          createdAt: DateTime.now(),
          loveCount: index,
          commentCount: index,
          viewCount: index,
          attachmentCount: index,
        );
      });
    });
  }

  static Future<List<Content>> getRecent() async {
    return Future.delayed(Duration(seconds: 4), () {
      return List.generate(10, (int index) {
        return Content(
          id: index,
          profilePicUrl:
              'https://api.adorable.io/avatars/285/circle@adorable.png',
          title: 'Content $index',
          artistName: 'Artist $index',
          createdAt: DateTime.now(),
          loveCount: index,
          commentCount: index,
          viewCount: index,
          attachmentCount: index,
        );
      });
    });
  }
}
