import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class UrlHelpers {
  static void reportABug() async {
    const subject = '[DRIBBBBLE ANDROID] Bug Report';
    const body = 'Thanks for filling a bug!';
    const url = 'mailto:support@dribbbble.com?subject=$subject&body=$body';
    _openUrl(url);
  }

  static void contactUs() async {
    const subject = '[DRIBBBBLE ANDROID] Hello!';
    const body = 'Hi!';
    const url = 'mailto:support@dribbbble.com?subject=$subject&body=$body';
    _openUrl(url);
  }

  static void rateApp() async {
    const url =
        'http://play.google.com/store/apps/details?id=mathieumaree.rippple';
    _openUrl(url);
  }

  static void shareApp() {
    const String message = 'You should give a try to Dribbbble for Android, '
        'it\'s freaking cool! http://play.google.com/store/apps/details?id=mathieumaree.rippple';
    Share.share(message);
  }

  static void _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Couldn\'t launch URL');
    }
  }
}
