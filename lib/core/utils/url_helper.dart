import 'package:url_launcher/url_launcher.dart';

abstract final class UrlHelper {
  static Future<void> openUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    }
  }

  static Future<void> sendEmail(String email, {String subject = ''}) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: subject.isNotEmpty ? {'subject': subject} : null,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
