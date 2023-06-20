import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/common_dialog.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/ward_model.dart';
import '../models/data_model.dart';

class DataController extends GetxController{


  //Created an instance of the cloud firestore
  final firebaseInstance = FirebaseFirestore.instance;

  //Created a map where 2 keys are passed
  Map wardProfileData = {'wa_no': '', 'ward_officer_contact': '', 'ward_officer_name': '', 'ward_supply_date': ''};
  Map userProfileData = {'bill_due': '', 'no_of_taps': '', 'owner_name': '', 'seq_no': '', 'tap_no': '', 'tap_size': '', 'tap_type': '', 'tap_usage': '',};



  //Instance of AuthController
  AuthController authController = AuthController();



  //--List to handle all the User data from DB--//
  List<Ward> loginUserData = [];

  //--List to handle all the Ward data from DB--//
  List<WardData> wardData = [];

  //Whenever this controller file is ready, call the given methods
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






  // //Method (function) for getting the User Profile Data from the Firestore DB
  Future<void> getUserProfileData() async {
    // print("user id ${authController.userId}");
    try {

      //--Query Starts--//
      //var response1 = await firebaseInstance.collection('Wards').where('wa_no', isEqualTo: authController.w_no).get();
      //--Query Ends--//



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






  //---2. To get User Data---//
  Future<void> getUserData() async {
    print("loginUserData YEs $loginUserData");
    print("Random");
    print(AuthController.w_no);
    print("Test");
    print(AuthController.userId);
    print("zzzz");
    print(AuthController.tap_no);

    //--empty the data from the loginUserData list--//
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
        //loop. The data of indexing is stored in "result"
        userResponse.docs.forEach(
              (result) {
            print(result.data());
            print("User Firebase Document ID :  ${result.id}");

            //add Data into the list
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
      //--added data in the "loginUserData" list--//
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


  //--3. Fetch data from Ward DB to show on UI--//


  Future<void> getWardData() async {
    print("wardData YEs $wardData");
    print("Random");
    print(AuthController.w_no);
    print("Test");
    print(AuthController.userId);
    print("zzzz");
    print(AuthController.tap_no);

    //--empty the data from the wardData list--//
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
        //loop. The data of indexing is stored in "result2"
        userResponse.docs.forEach(
              (result2) {
            print(result2.data());
            print("Ward Firebase Document ID :  ${result2.id}");

            //add Data into the list
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
      //--added data in the "wardData" list--//
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