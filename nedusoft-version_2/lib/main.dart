import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:stacked_services/stacked_services.dart';

import 'UI/IntroScreen/Intro_screen.dart';
import 'Utils/custom_bottomsheet.dart';
import 'Utils/custom_snackbar.dart';
import 'app/app.router.dart';
import 'core/service_locator/service_locator.dart';
import 'core/services/firebase_analytics.dart';
import 'core/services/needed_utils.dart';

enum SnackbarType { success, failure }

enum BottomSheetType {
  filters,
}

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  bottomSheetService.setCustomSheetBuilders({BottomSheetType.filters: (context, sheetRequest, completer) => FiltersBoxBottomSheet(request: sheetRequest, completer: completer)});
}

const bool _intialized = false;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

Future<void> loadNecessaryAssets() async {
  locator<SnackbarService>().registerCustomSnackbarConfig(variant: SnackbarType.success, config: customSnackbar(type: SnackbarType.success));
  locator<SnackbarService>().registerCustomSnackbarConfig(variant: SnackbarType.failure, config: customSnackbar(type: SnackbarType.failure));
  setupBottomSheetUi();

  var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
  // ignore: unnecessary_new
  var initializationSettingsIOS = const DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {},
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  pushNotification(_intialized, _firebaseMessaging);

  final fcmToken = await _firebaseMessaging.getToken();
  print('The token is $fcmToken');
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await locator<NeededVariables>().load(appVersion: packageInfo.version, appBuildNumber: packageInfo.buildNumber, token: fcmToken, type: Platform.isIOS ? 'IOS' : 'ANDROID', version: "");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureServicesSetup();
  await loadNecessaryAssets();
  runApp(
    BoardingScreen(),
  );
}

void pushNotification(bool value, FirebaseMessaging firebaseMessaging) async {
  if (!value) {
    // For iOS request permission first.
    await firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        await _showNotification(1234, message.notification!.title, message.notification!.body, json.encode(message.data));
      }
    });
    value = true;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

Future<void> _showNotification(
  int notificationId,
  String? notificationTitle,
  String? notificationContent,
  String payload, {
  String channelId = '1234',
  String channelTitle = 'Android Channel',
  String channelDescription = 'Default Android Channel for notifications',
  Priority notificationPriority = Priority.high,
  Importance notificationImportance = Importance.max,
}) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    channelId,
    channelTitle,
    channelDescription: channelDescription,
    playSound: false,
    importance: notificationImportance,
    priority: notificationPriority,
  );
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(presentSound: false);
  var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    notificationId,
    notificationTitle,
    notificationContent,
    platformChannelSpecifics,
    payload: payload,
  );
}

// ignore: use_key_in_widget_constructors
class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [locator<AnalyticsServices>().getObserver()],
      // Construct the StackedRouter and set the onGenerateRoute function
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
