// Importing necessary dependencies and packages
import 'package:app/controllers/common_dialog.dart';
import 'package:app/views/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController
{ 
  //To get the user id
  static var userId;
  static var tap_no;
  static var w_no;
  static var e_mail;

  // Function for user sign up
  Future<void> signUp(ward_no,tap_rr_no,email,password) async{
    try {
      //Shows the loading circle
      CommonDialog.showLoading();
      // Create user with email and password using Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //Email and password is taken here
          email: email.trim(),
          password: password
      );
      print(userCredential);
      CommonDialog.hideLoading();

      //---Database Query---//
      try {
        CommonDialog.showLoading();

        //Create Cloud Firestore Instance
        //"userslist" is the collection name
        //------add the data to db while signing up---//

        // var response =
        // await FirebaseFirestore.instance.collection('userslist').add({
        //   'ward_no': ward_no,
        //   'user_Id': userCredential.user!.uid,
        //   'tap_no': tap_rr_no,
        //   "password": password,
        //   'joinDate': DateTime.now().millisecondsSinceEpoch,
        //   'email': email
        // });
        // print("Firebase response1111 ${response.id}");
        CommonDialog.hideLoading();

      }
      catch (exception) {
        CommonDialog.hideLoading();
        print("Error Saving Data at firestore $exception");
      }


      Get.back();
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'weak-password') {
        CommonDialog.showErrorDialog(description: 'The password provided is too weak. Enter a minimum of 6 characters.');
        print('The password provided is too weak.');

        /////////////////////////
      }
      else if (e.code == 'email-already-in-use') {
        CommonDialog.showErrorDialog(description: 'showErrorDialog ');
        print('The account already exists for that email.');
      }
    }
    catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: 'Sorry! Something went wrong.');
      print(e);
    }
  }

  // Function for user login
  Future<void> login(ward_no,tap_rr_no,email,password) async {
    print("FROM LOGIN PAGE BAYBAY");
    print('$ward_no,$tap_rr_no,$email,$password');
    //Save userID, Tap No. , and Ward no.
    //------NOTE : This var is used to fetch the data from Database-----//
    tap_no = tap_rr_no;
    w_no = ward_no;
    e_mail = email;

    try {
      CommonDialog.showLoading();

      // Sign in with email and password using Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email.trim(),
          password: password
      );
      print(userCredential.user!.uid);
      userId = userCredential.user!.uid;

      CommonDialog.hideLoading();


      Get.off(() => HomeScreen());
      
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommonDialog.showErrorDialog(description: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommonDialog.showErrorDialog(description: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }
}

/**
The code includes an AuthController class responsible for user authentication and authorization functionalities.
It imports necessary dependencies and packages such as 'common_dialog.dart', 'home_screen.dart', 'cloud_firestore.dart', 'firebase_auth.dart', 'get.dart', and 'shared_preferences.dart'.

The AuthController class has functions for user sign up and login. 
The signUp function takes parameters like ward number, tap number, email, and password to create a user using Firebase Authentication.
It also performs database operations using Cloud Firestore.

The login function handles user login by taking email and password parameters and authenticating the user using Firebase Authentication.
If the login is successful, the user is directed to the HomeScreen.

The class includes static variables to store user-related information like user ID, tap number, ward number, and email.
These variables are accessible throughout the class.

The class utilizes the CommonDialog class for displaying loading screens and error dialogs during sign-up and login operations.
*/