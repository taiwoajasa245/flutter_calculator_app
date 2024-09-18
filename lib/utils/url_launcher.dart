import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  Future<void> launch(String uri) {
    final Uri url = Uri.parse(uri);
    return _launchURL(url);
  }

  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      // Specifying the mode ensures that the URL is opened in an external browser
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Open in the external browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
