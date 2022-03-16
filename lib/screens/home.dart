import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pushnotification/notificationService/local_notification_service.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((value){

      if(value != null)
      {

      }

    });

    FirebaseMessaging.onMessage.listen((event) {
      if(event.notification != null)
      {
          LocalNotification.createanddisplaynotification(event);
      }
    });


    // app in background .....

    FirebaseMessaging.onMessageOpenedApp.listen((event) { 
      print('FirebaseMessaging.onMessageOpenedApp');
      if(event.notification != null)
      {
          print(event.notification!.title);
          print(event.notification!.body);

      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification App'),),
    );
  }
}