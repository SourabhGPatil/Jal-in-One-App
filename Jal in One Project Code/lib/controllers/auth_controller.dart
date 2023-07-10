// Importing necessary dependencies and packages
import 'package:app/controllers/common_dialog.dart';
import 'package:app/views/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController{ //Right

  //To get the user id
  static var userId;
  static var tap_no;
  static var w_no;
  static var e_mail;

  Future<void> signUp(ward_no,tap_rr_no,email,password) async{
    try {
      //Shows the loading circle
      CommonDialog.showLoading();
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
      } else if (e.code == 'email-already-in-use') {
        CommonDialog.showErrorDialog(description: 'showErrorDialog ');
        print('The account already exists for that email.');
      }
    } catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: 'Sorry! Something went wrong.');
      print(e);
    }
  }

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