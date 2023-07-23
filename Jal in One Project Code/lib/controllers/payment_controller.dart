// Importing necessary dependencies and packages
import 'package:get/get.dart'; // Importing GetX package for state management
import 'package:razorpay_flutter/razorpay_flutter.dart'; // Importing Razorpay Flutter plugin for payment handling
import 'package:fluttertoast/fluttertoast.dart'; // Importing Fluttertoast for showing toast messages

class PaymentController extends GetxController {
  late Razorpay razorpay; // Razorpay object to handle payment operations

  // Method to initialize the RazorPay Object
  @override
  void onInit() {
    //TODO: implement onInit
    super.onInit();
    razorpay = Razorpay(); // Initializing the Razorpay object

    // Event Listeners for different payment events
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    //TODO : implement dispose
    super.dispose();
    razorpay.clear(); // Clearing the Razorpay object when the controller is disposed
  }

  // Event handler for successful payment
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    String msg = response.orderId! + "\n" + response.paymentId! + "\n" + response.signature!;
    Get.snackbar('Payment Successful', msg); // Displaying a snackbar for payment success
  }

  // Event handler for payment errors
  void _handlePaymentError(PaymentFailureResponse response) {
    String? msg = response.message;
    Get.snackbar('Payment Error Occured', msg!); // Displaying a snackbar for payment error
    Fluttertoast.showToast(
        msg: 'Payment Error Occured $msg!' // Displaying a toast message for payment error
    );
  }

  // Event handler for external wallet response
  void _handleExternalWallet(ExternalWalletResponse response) {
    String? msg = response.walletName;
    Get.snackbar('External Wallet Successful', msg!); // Displaying a snackbar for external wallet success
  }

  // Method to dispatch the payment process
  void dispatchPayment(double amount, String name, String contact, String description, String email, String wallet) {
    var options = {
      'key': 'rzp_test_ggVr3t5Q7tcK8E', // Razorpay API key
      'amount': amount, // Payment amount
      'name': name, // Name of the customer
      'description': description, // Description of the payment
      'prefill': {'contact': contact, 'email': email}, // Customer contact and email details
      'external': {
        'wallets': [wallet] // External wallet preferences (e.g., Paytm, Google Pay)
      }
    };

    try {
      razorpay.open(options); // Initiating the payment process with the provided options
    } catch (e) {
      // Handling any exceptions that occur during the payment process (no specific handling is done here)
    }
  }
}

/**
* In summary, this Dart code defines a PaymentController class that handles payment operations using the Razorpay Flutter plugin.
* It initializes the Razorpay object, sets up event listeners for payment success, payment errors, and external wallet responses.
* It also includes methods to handle these events and dispatch the payment process with relevant options.
* The class leverages GetX for state management and shows snackbar messages for payment status.
* It also displays toast messages for payment errors.
 */