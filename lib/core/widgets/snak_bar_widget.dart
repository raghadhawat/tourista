import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class SnakBarWidget extends StatelessWidget {
  const SnakBarWidget({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: kPrimaryColor,
        title: 'Failure!',
        message: message,
        messageFontSize: 14,
        contentType: ContentType.failure,
      ),
    );
  }
}
