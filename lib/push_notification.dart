import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


final FlutterLocalNotificationsPlugin  notifgaguna =FlutterLocalNotificationsPlugin();
notifikasi() async{
  final fcm = FirebaseMessaging.instance;
  debugPrint("token : ${(await FirebaseMessaging.instance.getToken())}");

  try{
    
      await fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,

      );

      await fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      
     
  } catch (e){
    debugPrint(e.toString());
  }

      FirebaseMessaging.onMessage.listen(onMessage);
      FirebaseMessaging.onBackgroundMessage((onBackgroundMessage));
      FirebaseMessaging.onMessageOpenedApp.listen(open);
      
   final pesan = await fcm.getInitialMessage();
      if(pesan != null){
   final data = pesan.data;
   debugPrint("Kamu bisa melakukan apapun pada data $data" );
   
   
 }
 
  
}

   void onMessage(RemoteMessage pesan){
      debugPrint("Kamu menerima pesan! ${pesan.notification?.title}");
      debugPrint("${pesan.notification?.body}");
      RemoteNotification?Notification = pesan.notification;
      AndroidNotification? android = pesan.notification?.android;
      if(Notification != null && android != null){
        notifgaguna.show( Notification.hashCode,Notification.title , Notification.body,
         NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            color: Colors.blue,
            icon: '@mipmap/ic_launcher',
          )
         ),
        );
      }
  }

  Future <void> onBackgroundMessage (RemoteMessage pesan) async {
      debugPrint("Kamu menerima pesan! ${pesan.notification?.title}");
      debugPrint("${pesan.notification?.body}");
      
  }

  void open(RemoteMessage pesan){
    final data = pesan.data;
    debugPrint("Kamu bisa melakukan apapun pada data $data" );
  }

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  "channelku",
   "channelku",
   importance: Importance.high
);
 

  