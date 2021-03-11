import 'package:url_launcher/url_launcher.dart';

class Command {
  static final all = [google];
  static const google = "open";
}

class Settings {
  static void scantext(String rawtext) {
    final text = rawtext.toLowerCase();
    if (text.contains(Command.google)) {
      final _url = _getText(text: text, command: Command.google);
      openUrl(url: _url);
    }
  }

  static String _getText({
    String text,
    String command,
  }) {
    final indexCommand = text.indexOf(command);
    final indexAfter = indexCommand + command.length;

    if (indexCommand == -1) {
      return null;
    } else {
      return text.substring(indexAfter).trim();
    }
  }

  static Future openUrl({String url}) async {
    if (url.trim().isEmpty) {
      await _openUrl('http://google.com');
    } else {
      await _openUrl('http:$url.com');
    }
  }
  static Future _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
