import 'dart:convert';

import 'package:tourista/constants.dart';
import 'package:tourista/features/notification/data/services/notification_services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String cluster = 'ap1';
  final String appKey = '645e69e0cf30d1ca3934';
  final String channelName = 'popup-channel';
  final String attractionChannelName = 'popup-channel';

  late WebSocketChannel channel;

  void connect() {
    String webSocketUrl = 'wss://ws-$cluster.pusher.com/app/$appKey?protocol=7';
    final wsUrl = Uri.parse(webSocketUrl);
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen(
      (message) {
        final decodedMessage = jsonDecode(message);

        if (decodedMessage['event'] != 'pusher:connection_established' &&
            decodedMessage['event'] !=
                'pusher_internal:subscription_succeeded') {
          if (decodedMessage['event'] == 'new-attraction') {
            LocalNotificationService.showScheduledNotification(
                jsonDecode(decodedMessage['data'])['message'].toString(),
                decodedMessage['event'],
                0);
          } else if (decodedMessage['event'] != 'new-attraction' &&
              jsonDecode(decodedMessage['data'])['userId'] == kUserId) {
            if (jsonDecode(decodedMessage['data'])['tripId'] == null) {
              LocalNotificationService.showScheduledNotification(
                  jsonDecode(decodedMessage['data'])['name'].toString(),
                  decodedMessage['event'],
                  jsonDecode(decodedMessage['data'])['userId']);
            } else {
              LocalNotificationService.showScheduledNotification(
                  jsonDecode(decodedMessage['data'])['name'].toString(),
                  decodedMessage['event'],
                  jsonDecode(decodedMessage['data'])['tripId']);
            }
          }
        }

        if (decodedMessage['event'] == 'pusher:connection_established') {
          channel.sink.add(jsonEncode({
            'event': 'pusher:subscribe',
            'data': {
              'channel': channelName,
            },
          }));
        }
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        connect(); // Attempt to reconnect
      },
    );
  }
}
