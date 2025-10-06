import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class NotificationService {
  final String url = 'https://api.onesignal.com/notifications';

  static const String oneSignalAppId = "0a35afa9-5361-43e2-9149-df923ce38aee";
  static const String oneSignalRestApiKey =
      "os_v2_app_bi227kktmfb6fekj36jdzy4k52uqvfxovrmu37nwo3rmxj6trrbh3ariqad34oeszat36ip5s6n6g7hi26i5ozk547hn7zwnemomssy";

  /// 🔹 Call this once in main.dart after FirebaseAuth is ready
  Future<void> initOneSignal() async {
    OneSignal.initialize(oneSignalAppId);

    // ✅ Foreground listener (when app is open)
    OneSignal.Notifications.addForegroundWillDisplayListener((event) async {
      final title = event.notification.title ?? "No title";
      final body = event.notification.body ?? "";
      final notificationId = event.notification.notificationId;

      // Save to Firestore
      await _saveNotificationToFirestore(
        title,
        body,
        notificationId: notificationId,
      );

      // Show notification
      event.preventDefault();
      OneSignal.Notifications.displayNotification(event.notification.toString());
    });

    // ✅ Click listener (when user taps notification)
    OneSignal.Notifications.addClickListener((event) async {
      final notificationId = event.notification.notificationId;
      await markNotificationAsOpened(notificationId);
    });
  }

  /// 🔹 Send a notification (from inside app)
  Future<void> sendNotification() async {
    try {
      var pushId = OneSignal.User.pushSubscription.id.toString();
      var title = "تم اضافة طلب جديد";
      var body = "يمكنك متابعة الطلب من صفحة الطلبات";

      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic $oneSignalRestApiKey',
        },
        body: jsonEncode({
          "app_id": oneSignalAppId,
          "contents": {"en": body},
          "include_player_ids": [pushId],
          "headings": {"en": title},
        }),
      );

      if (response.statusCode == 200) {
        // Save also in Firestore
        await _saveNotificationToFirestore(title, body, notificationId: pushId);
      } else {
      }
    } catch (e) {
   
    }
  }

  /// 🔹 Save notification into Firestore
  Future<void> _saveNotificationToFirestore(
    String title,
    String body, {
    String? notificationId,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('notifications')
        .add({
      'title': title,
      'body': body,
      'timestamp': FieldValue.serverTimestamp(),
      'opened': false,
      'oneSignalId': notificationId,
    });
  }

  /// 🔹 Mark notification as opened
  Future<void> markNotificationAsOpened(String notificationId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final notificationsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('notifications');

    final snapshot = await notificationsRef
        .where('oneSignalId', isEqualTo: notificationId)
        .get();

    for (var doc in snapshot.docs) {
      await doc.reference.update({'opened': true});
    }
  }
}
