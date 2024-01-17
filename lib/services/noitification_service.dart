// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';

// class NotificationService {
//   static Future<void> initializeNotification() async {
//     await AwesomeNotifications().initialize(
//         null,
//         [
//           NotificationChannel(
//               channelGroupKey: 'basic_channel_group',
//               channelKey: 'basic_channel',
//               channelName: 'Basic notifications',
//               channelDescription: 'Notification channel for basic tests',
//               defaultColor: Color(0xFF9D50DD),
//               ledColor: Colors.white,
//               playSound: true,
//               onlyAlertOnce: true,
//               importance: NotificationImportance.Max,
//               channelShowBadge: true,
//               criticalAlerts: true),
//         ],
//         channelGroups: [
//           NotificationChannelGroup(
//               channelGroupKey: 'high_importance_chanel_group',
//               channelGroupName: 'Group 1'),
//         ],
//         debug: true);
//     await AwesomeNotifications()
//         .isNotificationAllowed()
//         .then((isAllowed) async {
//       if (!isAllowed) {
//         await AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });

//     // await AwesomeNotifications().setListeners(onActionReceivedMethod: , onDismissActionReceivedMethod: ,onNotificationCreatedMethod: ,onNotificationDisplayedMethod: )
//   }
// }
