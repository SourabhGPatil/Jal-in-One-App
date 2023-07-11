// Importing necessary dependencies and packages
import 'dart:async'; // Importing the async package for Timer functionality
import 'package:flutter/material.dart'; // Importing the Flutter Material package
import 'dart:ui'; // Importing the dart:ui package for UI-related functionality
import 'package:flutter/services.dart'; // Importing the Flutter Services package
import 'login_screen.dart'; // Importing the LoginScreen widget

// This class represents the SplashScreen widget, which is a StatefulWidget.
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// This class represents the state of the SplashScreen widget.
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();

    // Using Timer to navigate to the LoginScreen after 5 seconds
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    // Building the UI for the SplashScreen widget
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Color(0xFFFF800B),Color(0xFFCE1010),]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/Transparent_Logo.png",
                  height: 400.0,
                  width: 400.0,
                ),
                Text("JAL IN ONE",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),

                Text("\n\nMade with ❤ by the people of Belagavi \n for the people of Belagavi.",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                  ),
                ),

                Text("\n\n\n\n\n\n\n\n © Computer Science and Engineering Department,\nJain College of Engineering and Research, Udyambag, Belgaum, Karnataka",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),

            CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}

/*
* Overall, this code defines the SplashScreen widget and its state. The widget is responsible for displaying a splash screen
* with a logo and some introductory text. After 5 seconds, it automatically navigates to the LoginScreen using the Timer class.
* The UI is built using a Container with a gradient background, and the logo and text are centered vertically and horizontally.
* The CircularProgressIndicator is also displayed to indicate that the app is loading.
*/