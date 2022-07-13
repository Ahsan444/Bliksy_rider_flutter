import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../firebase_options.dart';

class FirebaseCloudMessaging {
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // RemoteNotification? notification = message.notification;
    // AndroidNotification? androidNotification = message.notification?.android;


    // print('notification from firebase $notification');
    //
    // if (notification != null) {
    //   Get.to(OrderScreen());
    // }
    print('receive the notification ');
  }

  // add the code in the main.dart file after configure the firebase cloud messaging
//firebase messaging code
/*
var fc = FirebaseCloudMessaging();
FirebaseMessaging.onBackgroundMessage(fc.firebaseMessagingBackgroundHandler);
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
FirebaseMessaging messaging = FirebaseMessaging.instance;
//Firebase messaging setup

*//* NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );*//*

//  debugPrint('User granted permission: ${settings.authorizationStatus}');

FirebaseMessaging.onMessage.listen((RemoteMessage message) {
debugPrint('Got a message whilst in the foreground!');
debugPrint('Message data-: ${message.data}');

RemoteNotification? notification = message.notification;
AndroidNotification? androidNotification = message.notification?.android;
debugPrint('notification data is ${message.notification?.body}');

debugPrint(
'Message also contained a notification: ${message.notification}');
debugPrint('Message body: ${message.data["body"]}');
});

// notification setup move to specific screen
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message)  async{
debugPrint('Got a message whilst in the foreground!');
debugPrint('Message data: ${message.data}');
Get.to(OrderScreen());

debugPrint(
'Message also contained a notification: ${message.notification}');
debugPrint('Message body: ${message.data["body"]}');
RemoteNotification? notification = message.notification;

//OrderDetailModel dataValue= await orderDetailController.orderDetailMethod(id: prefs.getString('orderIDD'));
//AndroidNotification? androidNotification = message.notification?.android;
//debugPrint('order:' + message.data['order_id']);
//debugPrint('key:' + message.data['key']);
});*/
}