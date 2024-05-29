import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationHelper extends GetxController {
  @override
  void onInit() {
    super.onInit();
    init();
  }

  RxBool isNotify = false.obs;
  final notification = FlutterLocalNotificationsPlugin();
  init() async {
    notification.initialize(
        const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/launcher_icon'),
            iOS: DarwinInitializationSettings()),
        onDidReceiveNotificationResponse: onTapLocalNotification);
    tz.initializeTimeZones();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isNotify.value = prefs.getBool('is_notify') ?? false;
  }

  void onTapLocalNotification(NotificationResponse notificationResponse) {
    Get.toNamed('home');
  }

  scheduleNotification(String title, String body) async {
    notificationRequest();
    var androidDetails = const AndroidNotificationDetails(
        'important_notifications', 'my_channel',
        importance: Importance.max, priority: Priority.high);
    var iosDetails = const DarwinNotificationDetails();
    var notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    await notification.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  FutureOr<void> scheduleDailyNotification() async {
    tz.initializeTimeZones();
    final localTimezone = tz.getLocation('Asia/Kolkata');
    notificationRequest();
    var androidDetails = const AndroidNotificationDetails(
        'daily_notifications', 'my_channel',
        importance: Importance.max, priority: Priority.high);
    var iosDetails = const DarwinNotificationDetails();
    var notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    var now = tz.TZDateTime.now(localTimezone);
    var scheduledTime =
        tz.TZDateTime(localTimezone, now.year, now.month, now.day, 10, 8);    
  
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }
    await notification.zonedSchedule(
        0,
        'Time to Build a Better You!',
        '''Keep the streak alive! Log today's progress and keep moving towards your big goals.''',
        scheduledTime,
        notificationDetails,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  notificationRequest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    final notify = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    final alarm = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestExactAlarmsPermission();
    if (notify != null && notify && alarm != null && alarm) {
      prefs.setBool('is_notify', true);
      isNotify.value = true;
    } else {
      prefs.setBool('is_notify', false);
      isNotify.value = false;
    }
  }

  cancelAllNotifications(bool value) async {
    if (value) {
      scheduleDailyNotification();
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_notify', false);
      isNotify.value = false;
      await notification.cancelAll();
    }
  }
}
