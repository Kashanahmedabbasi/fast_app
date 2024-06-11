import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../../bindings.dart';
import '../../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  init() {
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      try {
        if (message.notification != null) {
          Future<String> _downloadAndSaveFile(
              String url, String fileName) async {
            final Directory directory =
                await getApplicationDocumentsDirectory();
            final String filePath = '${directory.path}/$fileName';
            final http.Response response = await http.get(Uri.parse(url));
            final File file = File(filePath);
            await file.writeAsBytes(response.bodyBytes);
            return filePath;
          }

          if (Platform.isAndroid) {
            String bigPicturePath;
            AndroidNotificationDetails androidPlatformChannelSpecifics;
            if (message.notification!.android!.imageUrl != null &&
                '${message.notification!.android!.imageUrl}' != 'N/A') {
              print('${message.notification!.android!.imageUrl}');
              bigPicturePath = await _downloadAndSaveFile(
                  message.notification!.android!.imageUrl ??
                      'https://picsum.photos/200/300',
                  'bigPicture');
              final BigPictureStyleInformation bigPictureStyleInformation =
                  BigPictureStyleInformation(
                FilePathAndroidBitmap(bigPicturePath),
              );
              androidPlatformChannelSpecifics = AndroidNotificationDetails(
                  channel.id, channel.name, channel.description,
                  icon: 'newnotification',
                  styleInformation: bigPictureStyleInformation,
                  playSound: true);
            } else {
              androidPlatformChannelSpecifics = AndroidNotificationDetails(
                  channel.id, channel.name, channel.description,
                  icon: 'newnotification',
                  styleInformation: BigTextStyleInformation(message
                      .notification!.body
                      .toString()
                      .replaceAll('<p>', '')
                      .replaceAll('</p>', '')),
                  playSound: true);
            }
            // final AndroidNotificationDetails androidPlatformChannelSpecifics2 =
            final NotificationDetails platformChannelSpecifics =
                NotificationDetails(android: androidPlatformChannelSpecifics);
            flutterLocalNotificationsPlugin.show(
                1,
                message.notification!.title!
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', ''),
                message.notification!.body!
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', ''),
                platformChannelSpecifics);
          } else if (Platform.isIOS) {
            final String bigPicturePath = await _downloadAndSaveFile(
                message.notification!.apple!.imageUrl ??
                    'https://picsum.photos/200/300',
                'bigPicture.jpg');
            final IOSNotificationDetails iOSPlatformChannelSpecifics =
                IOSNotificationDetails(attachments: <IOSNotificationAttachment>[
              IOSNotificationAttachment(bigPicturePath)
            ], presentSound: true);
            const IOSNotificationDetails iOSPlatformChannelSpecifics2 =
                IOSNotificationDetails(presentSound: true);
            final NotificationDetails notificationDetails = NotificationDetails(
              iOS: message.notification!.apple!.imageUrl != null
                  ? iOSPlatformChannelSpecifics
                  : iOSPlatformChannelSpecifics2,
            );
            await flutterLocalNotificationsPlugin.show(
                1,
                message.notification!.title!
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', ''),
                message.notification!.body!
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', ''),
                notificationDetails);
          }
        }
      } catch (e) {
        print('Exception - main.dart - onMessage.listen(): $e');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      home: const Scaffold(
        body: Center(child: Text("Let'ss Start")),
      ),
    );
  }
}
