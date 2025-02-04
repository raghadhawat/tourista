import 'the_notifcation.dart';

class AllNotificationModel {
  List<TheNotifcation>? theNotifcations;

  AllNotificationModel({this.theNotifcations});

  factory AllNotificationModel.fromJson(Map<String, dynamic> json) {
    return AllNotificationModel(
      theNotifcations: (json['theNotifcations'] as List<dynamic>?)
          ?.map((e) => TheNotifcation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'theNotifcations': theNotifcations?.map((e) => e.toJson()).toList(),
      };
}
