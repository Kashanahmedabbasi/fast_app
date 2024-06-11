import 'package:fast_app/Screens/Admin/home.dart';
import 'package:fast_app/bindings.dart';
import 'package:fast_app/screens/admin/controller/AuthController.dart';
import 'package:fast_app/screens/admin/controller/SettingController.dart';
import 'package:fast_app/screens/chat/chat_list_screen.dart';
import 'package:fast_app/screens/dashboard.dart';
import 'package:fast_app/screens/product_detail.dart/product_detail.dart';
import 'package:fast_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel_for_partner',
  'High Importance Notifications for partner',
  'This channel is used for important notifications.',
  importance: Importance.defaultImportance,
);
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();

    print('Handling a background message ${message.messageId}');
  } catch (e) {
    print('Exception - main.dart - _firebaseMessagingBackgroundHandler(): $e');
  }
}

setBackground() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('initialized');
  await setBackground();
  print('set');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => AuthController(),
    ),
    ChangeNotifierProvider(
      create: (_) => SettingController(),
    ),
    // ChangeNotifierProvider(
    //   create: (_) => SettingController(),
    // ),
    // ChangeNotifierProvider(
    //   create: (_) => AuthController(),
    // )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(),
      title: 'Flutter Demo',
      home: DashboardScreen(),
    );
  }
}
