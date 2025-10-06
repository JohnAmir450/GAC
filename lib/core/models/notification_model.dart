import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String title;
  final String body;
  final Timestamp timestamp;
  final String oneSignalId;
  final bool isOpened;

  NotificationModel({
    required this.title,
    required this.body,
    required this.timestamp,
    required this.oneSignalId,
    required this.isOpened,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      oneSignalId: map['oneSignalId'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      isOpened: map['opened'] ?? false,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'oneSignalId': oneSignalId,
      'timestamp': timestamp,
      'opened': isOpened,
    };
  }
}