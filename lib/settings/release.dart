import "package:flutter/material.dart";
import "package:flutter_markdown/flutter_markdown.dart";
import "package:inventree/app_colors.dart";
import "package:url_launcher/url_launcher.dart";

import "package:inventree/l10.dart";
import "package:inventree/helpers.dart";

class ReleaseNotesWidget extends StatelessWidget {
  const ReleaseNotesWidget(this.releaseNotes);

  final String releaseNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10().releaseNotes),
        backgroundColor: COLOR_APP_BAR,
      ),
      body: Markdown(
        selectable: false,
        data: releaseNotes,
        onTapLink: (url, href, title) {
          var link = href ?? "";
          if (link.isNotEmpty) {
            openLink(link);
          }
        },
      ),
    );
  }
}

class CreditsWidget extends StatelessWidget {
  const CreditsWidget(this.credits);

  final String credits;

  // Callback function when a link is clicked in the markdown
  Future<void> openLink(String url) async {
    final link = Uri.parse(url);

    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10().credits),
        backgroundColor: COLOR_APP_BAR,
      ),
      body: Markdown(
        selectable: false,
        data: credits,
        onTapLink: (url, href, title) {
          var link = href ?? "";
          if (link.isNotEmpty) {
            openLink(link);
          }
        },
      ),
    );
  }
}
