// Importing necessary dependencies and packages
import 'package:app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//Import the view screens
import 'package:app/views/login_screen.dart';
import 'package:get/get.dart';


// Background Notifications Handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling the background message :  ${message.messageId}');
}

// The main function where the app starts execution
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Firebase
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Running the app
  runApp(MyApp());
}


// This class represents the MyApp widget, which is the root of the application.
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // Building the app using GetMaterialApp for state management
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jal in one',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Setting the primary color theme
      ),
      home: FutureBuilder(
        //Initialize FlutterFire
        future: _initialization,
        builder: (context, snapshot){
          // Checking for errors
          if(snapshot.hasError) {
            return Center
              (child: Text('Could not connect'),
            );
          }

          //Once complete, show your application (i.e., Splash Screen)
          if(snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }

          // Otherwise, show loading indicator
          return Center(child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

/*
* Overall, this code imports necessary dependencies and packages.
* It sets up Firebase initialization and handles background messages for Firebase Messaging.
* The main function initializes Firebase and runs the app.
* The MyApp widget serves as the root of the application, setting up the theme and displaying the SplashScreen while Firebase initializes.
* The app is built using GetMaterialApp for state management and uses Get package for routing and managing states.
*/
