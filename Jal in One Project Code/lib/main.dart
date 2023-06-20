// ignore_for_file: prefer_const_constructors
import 'package:app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//Import the view screens
import 'package:app/views/login_screen.dart';
import 'package:get/get.dart';


//BG Notifications Handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling the background message :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jal in one',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        //Initialize FlutterFire
        future: _initialization,
        builder: (context, snapshot){
          //check for errors
          if(snapshot.hasError) {
            return Center
              (child: Text('Could not connect'),
            );
          }

          //Once complete, show your application
          if(snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }

          //Otherwise, show some loading stuff
          return Center(child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

