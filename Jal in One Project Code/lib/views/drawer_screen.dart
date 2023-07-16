// Importing necessary dependencies and packages
import 'package:app/controllers/data_controller.dart';
import 'package:app/views/ward_details_screen.dart';
import 'package:app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This class represents the AppDrawer widget, which is a StatelessWidget.
class AppDrawer extends StatelessWidget {

  // Instance of DataController
  final DataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // Building the UI for the AppDrawer widget
    return SafeArea(
      child: Container(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                // Styling the container with the primary color of the theme
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      // Displaying the title "Menu"
                      'Menu',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
              ),

              // Bill Payment option at sidebar
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Ward Details'),
                onTap: () {
                  Get.back(); // Closing the sidebar
                  Get.to(() => WardDetailsScreen()); // Navigating to WardDetailsScreen
                },
              ),

              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Get.to(() => LoginScreen()); // Navigating to LoginScreen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
* Overall, this code imports necessary dependencies and packages.
* It includes the DataController for managing data.
* The code defines the AppDrawer widget, which represents a sidebar menu in the app.
* It displays a title "Menu" and provides options for Ward Details and LogOut.
* When an option is tapped, it closes the sidebar and navigates to the respective screen using Get package for routing.
* The UI is built using a Drawer and ListTile widgets.
*/
