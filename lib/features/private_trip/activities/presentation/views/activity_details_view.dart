import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activity_details_view_body.dart';

class ActivityDetails extends StatelessWidget {
  const ActivityDetails({
    super.key,
    required this.activityInfo,
  });
  final Map<String, dynamic> activityInfo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ActivityDetailsViewBody(
          activityModel: activityInfo['activityModel'],
          dayDate: activityInfo['dayDate'],
          dayIndex: activityInfo['dayIndex'],
        ),
      ),
    );
  }
}
