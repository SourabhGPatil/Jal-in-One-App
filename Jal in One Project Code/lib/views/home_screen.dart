import 'package:app/controllers/data_controller.dart';
import 'package:app/controllers/payment_controller.dart';
import 'package:app/controllers/auth_controller.dart';
import 'package:app/views/drawer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'login_screen.dart';

// Background Notifications Handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling the background message :  ${message.messageId}');
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {


  // Create an instance of DataController
  final DataController controller = Get.put(DataController());

  // Create an instance of PaymentController
  final PaymentController paymentController = Get.put(PaymentController());

  // Created an instace of auth_controller.dart
  // final AuthController authController = Get.put(AuthController());

  // Create an instance of FirebaseAuth
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  @override
  void initState() {
    // Implement the initState method
    super.initState();
    getToken();
    initMessaging();
  }

  // Sign out function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getUserData();
    });


    return Scaffold(
      drawer: AppDrawer(),

      appBar:AppBar(
        centerTitle: true,
        title: Text('Homepage'),
        actions: [
          IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),


      // Body of the HomeScreen
      body: GetBuilder<DataController>(
        builder: (controller) => controller.loginUserData.isEmpty
            ? Center(
          child: Text('😔 NO DATA FOUND (: 😔'),
        )
            : ListView.builder(
          itemCount: controller.loginUserData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [

                  //--Ward Number--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Ward Number: ${controller.loginUserData[index].wardNo}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),


                  //--Tap Number--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Tap No.: ${controller.loginUserData[index].tapNo}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),


                  //--Owner Name--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Owner Name: ${controller.loginUserData[index].ownerName}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),


                  //--Sequence No.--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Sequence No.: ${controller.loginUserData[index].seqNo}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),


                  //--Bill Due--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Bill Due: ${controller.loginUserData[index].billDue}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              //Bill Payment Format
                              RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
                              double money = controller.loginUserData[index].billDue;
                              double tMoney = money*100;
                              String stringMoney = tMoney.toString().replaceAll(regex, '');
                              double totalMoney = double.parse(stringMoney);
                              paymentController.dispatchPayment(totalMoney, controller.loginUserData[index].ownerName , "9742152467", "Water Bill Payment for Tap No. ${controller.loginUserData[index].billDue}", AuthController.e_mail, "GPay");
                            },
                            child: Text('Pay Bill Now'),
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(10,30),
                                primary: Colors.purple,
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                textStyle:
                                const TextStyle(color:Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                          ),
                        ),
                      ],
                    ),
                  ),


                  //--No. of Taps--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "No. of Taps: ${controller.loginUserData[index].noOfTaps}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),


                  //--Tap Size--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Tap Size: ${controller.loginUserData[index].tapSize}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),

                  //--Tap Type--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Tap Type: ${controller.loginUserData[index].tapType}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),

                  //--Tap Usage--//
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),

                    //Container Decoration Part
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Colors.pink, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),

                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: new Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Tap Usage: ${controller.loginUserData[index].tapUsage}",
                          style: TextStyle(
                              color:Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }


  //---Notification Part---//

  // Function to retrieve the notification token
  Future<void> getToken() async
  {
    // Retrieve the Firebase Cloud Messaging token
    String? token = await FirebaseMessaging.instance.getToken();

    // Print a message indicating that the token is being printed
    print("NOTTTTTTTTTTTTTTTTTIFICATION");

    // Print the notification token
    print(token);
  }


  void initMessaging() {
    var androidInit = AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo

    var iosInit = IOSInitializationSettings();
    var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);

    // Initialize the FlutterLocalNotificationsPlugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initSetting);

    var androidDetails = AndroidNotificationDetails('1', 'Default',
      channelDescription: "Channel Description",
      importance: Importance.high,
    );

    var iosDetails = IOSNotificationDetails();

    var generalNotificationDetails =
    NotificationDetails(android: androidDetails, iOS: iosDetails);

    // Listen for incoming messages from Firebase Messaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message!.notification!;
      AndroidNotification android = message.notification!.android!;
      if(notification != null && android != null) {
        // Show the local notification using FlutterLocalNotificationsPlugin
        flutterLocalNotificationsPlugin.show(notification.hashCode,
            notification.title, notification.body, generalNotificationDetails);
      }
    }
    );
  }
}
