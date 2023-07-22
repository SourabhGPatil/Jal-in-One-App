// Importing necessary dependencies and packages
import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/common_dialog.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/ward_model.dart';
import '../models/data_model.dart';

// Defining a class called DataController
class DataController extends GetxController{


  //Created an instance of the cloud firestore
  final firebaseInstance = FirebaseFirestore.instance;

  // Created two maps to store ward profile data and user profile data
  Map wardProfileData = {'wa_no': '', 'ward_officer_contact': '', 'ward_officer_name': '', 'ward_supply_date': ''};
  Map userProfileData = {'bill_due': '', 'no_of_taps': '', 'owner_name': '', 'seq_no': '', 'tap_no': '', 'tap_size': '', 'tap_type': '', 'tap_usage': '',};

  //Instance of AuthController
  AuthController authController = AuthController();

  // List to handle all the User data from the database
  List<Ward> loginUserData = [];

  // List to handle all the Ward data from the database
  List<WardData> wardData = [];

  // This method is called when the controller is ready to be used
  void onReady() {
    super.onReady();
    getUserProfileData();
    //getWardData();
    getUserData();
    //getWardData();
  }


  // Future<void> getWardData() async {
  //   // print("user id ${authController.userId}");
  //   try {
  //
  //     //--Query Starts--//
  //     var response1 = await firebaseInstance.collection('Wards').where('wa_no', isEqualTo: AuthController.w_no).get();
  //     //--Query Ends--//
  //
  //
  //
  //     //var response2 = await firebaseInstance.collectionGroup('Users').where('tap_no', isEqualTo: authController.tap_no).get();
  //
  //
  //
  //     // Already in comment response.docs.forEach((result) {
  //     //   print(result.data());
  //     // });
  //
  //     //To access the "response" variable which contains data from DB
  //     //Saves the data to "userProfileData List
  //     if (response1.docs.length > 0) {
  //       wardProfileData['wa_no'] = response1.docs[0]['wa_no'];
  //       wardProfileData['ward_officer_contact'] = response1.docs[0]['ward_officer_contact'];
  //       wardProfileData['ward_officer_name'] = response1.docs[0]['ward_officer_name'];
  //       //wardProfileData['ward_supply_date'] = response1.docs[0]['ward_supply_date'];
  //     }
  //
  //     // if (response2.docs.length > 0) {
  //     //   userProfileData['bill_due'] = response2.docs[0]['bill_due'];
  //     //   userProfileData['no_of_taps'] = response2.docs[0]['no_of_taps'];
  //     //   userProfileData['owner_name'] = response2.docs[0]['owner_name'];
  //     //   userProfileData['seq_no'] = response2.docs[0]['seq_no'];
  //     //   userProfileData['tap_no'] = response2.docs[0]['tap_no'];
  //     //   userProfileData['tap_size'] = response2.docs[0]['tap_size'];
  //     //   userProfileData['tap_usage'] = response2.docs[0]['tap_usage'];
  //     //   userProfileData['tap_type'] = response2.docs[0]['tap_type'];
  //     // }
  //
  //
  //
  //
  //
  //     print(wardProfileData);
  //     //print(userProfileData);
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   } catch (error) {
  //     print(error);
  //   }
  // }






  // Method for getting the User Profile Data from the Firestore DB
  Future<void> getUserProfileData() async {
    // print("user id ${authController.userId}");
    try {

      //--Query Starts--//
      //var response1 = await firebaseInstance.collection('Wards').where('wa_no', isEqualTo: authController.w_no).get();
      //--Query Ends--//


      // Querying the Firestore to get the user's data based on the tap number
      var response2 = await firebaseInstance.collection('Users').where('tap_no', isEqualTo: AuthController.tap_no).get();




      // Already in comment response.docs.forEach((result) {
      //   print(result.data());
      // });

      //To access the "response" variable which contains data from DB
      //Saves the data to "userProfileData List
      // if (response1.docs.length > 0) {
      //   wardProfileData['ward_no'] = response1.docs[0]['wa_no'];
      //   wardProfileData['ward_officer_contact'] = response1.docs[0]['ward_officer_contact'];
      //   wardProfileData['ward_officer_name'] = response1.docs[0]['ward_officer_name'];
      //   wardProfileData['ward_supply_date'] = response1.docs[0]['ward_supply_date'];
      // }

      if (response2.docs.length > 0) {
        // Saving the retrieved user profile data into the userProfileData map
        userProfileData['bill_due'] = response2.docs[0]['bill_due'];
        userProfileData['no_of_taps'] = response2.docs[0]['no_of_taps'];
        userProfileData['owner_name'] = response2.docs[0]['owner_name'];
        userProfileData['seq_no'] = response2.docs[0]['seq_no'];
        userProfileData['tap_no'] = response2.docs[0]['tap_no'];
        userProfileData['tap_size'] = response2.docs[0]['tap_size'];
        userProfileData['tap_usage'] = response2.docs[0]['tap_usage'];
        userProfileData['tap_type'] = response2.docs[0]['tap_type'];
      }


      //print(wardProfileData);
      print("FINALLLLLLLLLLLLLLLLLLLLLL");
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }



  //---2. Method for getting the User Data from the Firestore DB---//
  Future<void> getUserData() async {
    print("loginUserData YEs $loginUserData");
    print("Random");
    print(AuthController.w_no);
    print("Test");
    print(AuthController.userId);
    print("zzzz");
    print(AuthController.tap_no);

    // Emptying the data from the loginUserData list
    loginUserData = [];
    var tap = AuthController.tap_no;

    try {
      CommonDialog.showLoading();
      final List<Ward> lodadedProduct = [];

      //DB Query to get the User Details
      var userResponse = await firebaseInstance
          .collection('Users')
          .where('tap_no', isEqualTo: AuthController.tap_no)
          .get();


      if (userResponse.docs.length > 0) {
        //Loop through the retrieved data and add it to the loadedProduct list.
        //The data of indexing is stored in "result"
        userResponse.docs.forEach(
              (result) {
            print(result.data());
            print("User Firebase Document ID :  ${result.id}");

            //Add Data into the list
            lodadedProduct.add(
              Ward(
                userId: result.id,
                wardNo: result['ward_no'],
                ownerName: result['owner_name'],
                tapNo: result['tap_no'],
                billDue: double.parse(result['bill_due']),
                noOfTaps: result['no_of_taps'],
                seqNo: result['seq_no'],
                tapSize: result['tap_size'],
                tapType: result['tap_type'],
                tapUsage: result['tap_usage'],
              ),
            );
          },
        );
      }
      // Adding data in the "loginUserData" list
      loginUserData.addAll(lodadedProduct);
      update();
      CommonDialog.hideLoading();

    } on FirebaseException catch (e) {
      CommonDialog.hideLoading();
      print("Error $e");
    } catch (error) {
      CommonDialog.hideLoading();
      print("error $error");
    }
  }


  //--3. // Method for fetching data from the Ward DB to show on UI --//


  Future<void> getWardData() async {
    print("wardData YEs $wardData");
    print("Random");
    print(AuthController.w_no);
    print("Test");
    print(AuthController.userId);
    print("zzzz");
    print(AuthController.tap_no);

    // Emptying the data from the wardData list
    wardData = [];

    try {
      CommonDialog.showLoading();
      final List<WardData> lodadedProduct2 = [];

      //DB Query to get the User Details
      var userResponse = await firebaseInstance
          .collection('Wards')
          .where('wa_no', isEqualTo: AuthController.w_no)
          .get();


      if (userResponse.docs.length > 0) {
        //Loop through the retrieved data and add it to the loadedProduct2 list
        //The data of indexing is stored in "result2"
        userResponse.docs.forEach(
              (result2) {
            print(result2.data());
            print("Ward Firebase Document ID :  ${result2.id}");

            //Add Data into the list
            lodadedProduct2.add(
              WardData(
                wardId: result2.id,
                wardNo: result2['wa_no'],
                officerContact: result2['ward_officer_contact'],
                  officerName: result2['ward_officer_name'],
                  waterSupplyDate: result2['water_supply_date'],
              ),
            );
          },
        );
      }

      // Adding data in the "wardData" list
      wardData.addAll(lodadedProduct2);
      update();
      CommonDialog.hideLoading();

    } on FirebaseException catch (e) {
      CommonDialog.hideLoading();
      print("Error $e");
    } catch (error) {
      CommonDialog.hideLoading();
      print("error $error");
    }
  }
}

/**
This Dart code defines a class called DataController, which is responsible for managing and retrieving data from Firebase Firestore for the user profile and ward details. Here's a breakdown of what the code does:

1. Import necessary dependencies and packages for the class.

2. Define a class called DataController that extends GetxController, which means it can be used with the GetX state management library.

3. Create an instance of the Firebase Firestore.

4. Declare two maps named wardProfileData and userProfileData to store ward profile data and user profile data, respectively.

5. Create an instance of the AuthController, which seems to handle authentication-related tasks.

6. Define two lists, loginUserData and wardData, to hold user and ward data from the database, respectively.

7. Implement the onReady() method, which is a GetX lifecycle method that runs when the controller is ready. It calls the methods getUserProfileData() and getUserData().

8. getUserProfileData(): This method queries the Firestore database to get the user's profile data based on the AuthController's tap_no. The retrieved data is saved into the userProfileData map.

9. getUserData(): This method queries the Firestore database to get user data based on the AuthController's tap_no. It saves the data into the loginUserData list, which holds instances of the Ward class, representing user details.

10. getWardData(): This method queries the Firestore database to get ward data based on the AuthController's w_no. It saves the data into the wardData list, which holds instances of the WardData class, representing ward details.

11. The code also includes some commented-out code, which seems to be related to querying the Firestore database for specific data fields and saving them into wardProfileData and userProfileData. These commented-out sections may have been used or considered for future implementation but are currently disabled.

Overall, this Dart code works as a controller to handle data retrieval and management related to user profiles and ward details from a Firebase Firestore database, making it accessible for use in a Flutter application.
 */