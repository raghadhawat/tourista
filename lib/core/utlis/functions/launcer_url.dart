import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';

Future<void> launchCustomUrl(context, String url) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    customSnackBar(context, 'Cannot launch $url');
  }

  // Hide loading indicator
  Navigator.of(context).pop();
}
