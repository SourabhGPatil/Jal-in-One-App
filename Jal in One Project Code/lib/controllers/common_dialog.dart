// Importing necessary dependencies and packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Defining a class called CommonDialog
class CommonDialog {
 // Function to show a loading dialog with an optional title 
 static showLoading({String title = "Loading..."}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

 // Function to hide the loading dialog
 static hideLoading() {
    Get.back();
  }

 // Function to show an error dialog with optional title and description
 static showErrorDialog(
      {String title = "Oops Error",
      String description = "Something went wrong "}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text("Okay"),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}

/**
The code defines a class called CommonDialog, which provides utility functions for displaying loading and error dialogs using the GetX package.

1. The showLoading function displays a loading dialog with an optional title.
It shows a circular progress indicator and the specified title, indicating that the app is performing some task or fetching data.
The loading dialog is modal, meaning it blocks user interaction with the rest of the app until it is dismissed.

2. The hideLoading function dismisses the currently displayed dialog, which is typically used to hide the loading dialog when the loading process is completed.

3. The showErrorDialog function displays an error dialog with an optional title and description.
It is used to inform the user about any errors or issues that occurred during a particular operation.
The error dialog shows the specified title, description, and an "Okay" button for the user to acknowledge the error.
Like the loading dialog, the error dialog is also modal, preventing user interaction with the rest of the app until dismissed. 
*/
