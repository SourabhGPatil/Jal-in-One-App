import 'package:app/controllers/data_controller.dart';
import 'package:app/controllers/payment_controller.dart';
import 'package:app/controllers/auth_controller.dart';
import 'package:app/views/drawer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'login_screen.dart';

//Created an instace of data_controller.dart
final DataController controller = Get.put(DataController());

class WardDetailsScreen extends StatefulWidget {

  @override
  _WardDetailsScreen createState() => _WardDetailsScreen();

}

class _WardDetailsScreen extends State<WardDetailsScreen> {

  //Instance of FirebaseAuth
  final FirebaseAuth auth = FirebaseAuth.instance;


  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getWardData();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ward Details Screen'),

        actions: [
          IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),

      //----B0DY OF THE Ward Details Screen----//
      body: GetBuilder<DataController>(
        builder: (controller) =>
        controller.wardData.isEmpty
            ? Center(
          child: Text('😔 NO DATA FOUND (: 😔'),
        )
            : ListView.builder(
          itemCount: controller.wardData.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [

                  //--WARD NO.--//
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
                          "Ward Number: ${controller.wardData[index].wardNo}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),



                  //--Water Supply Date--//
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
                          "Water Supply Date: ${controller.wardData[index]
                              .waterSupplyDate}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),







                  //--Officer Name--//
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
                          "Officer Name: ${controller.wardData[index]
                              .officerName}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),


                  //--Officer Contact No. --//
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
                          "Officer Contact No.: ${controller.wardData[index]
                              .officerContact}",
                          style: TextStyle(
                              color: Colors.white,
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
                            onPressed: () => launch("tel:${controller.wardData[index]
                      .officerContact}"),
                            child: Text('CALL'),
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

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
