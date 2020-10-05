import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  static Future<bool> tryOpenUrlInBrowser(String url) async {
    try {
      if (await canLaunch(url)) {
        return await launch(url);
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}