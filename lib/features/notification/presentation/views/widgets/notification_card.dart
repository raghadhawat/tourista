import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: Text(
                title,
                style: AppStyles.styleInterMedium19(context),
                maxLines: 3,
              ),
            ),
            Spacer(),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  border: Border.all(color: kPrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
