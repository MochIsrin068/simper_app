import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

// HANDLE MESSAGING
class MessagingDisposisi {
  static final Client client = Client();

  String subId;

  MessagingDisposisi({this.subId});

  // from 'https://console.firebase.google.com'
  // --> project settings --> cloud messaging --> "Server key"
  static const String serverKey =
      'AAAAgC7xhBM:APA91bHHTKBEIkhjMWo1LDJccMTnXrDbvAq0vxaEj0ZD9KSE7PKEQ9ctDTIMElEF34jkb0VHySf2XHda0ZPl3GoMGdDnDZZvyJ0YSk2KvO_TwzF7hSj2Zhr0HMZ0sAt_8UYFWotAfDtv';

  static Future<Response> sendToAll({
    @required String title,
    @required String body,
    @required String speceficttopic,
  }) =>
      sendToTopic(title: title, body: body, topic: speceficttopic);

  static Future<Response> sendToTopic(
          {@required String title,
          @required String body,
          @required String topic}) =>
      sendTo(title: title, body: body, fcmToken: '/topics/$topic');

  static Future<Response> sendTo({
    @required String title,
    @required String body,
    @required String fcmToken,
  }) =>
      client.post(
        'https://fcm.googleapis.com/fcm/send',
        body: json.encode({
          'notification': {'body': '$body', 'title': '$title'},
          'priority': 'high',
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
          },
          'to': '$fcmToken',
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
      );
}
