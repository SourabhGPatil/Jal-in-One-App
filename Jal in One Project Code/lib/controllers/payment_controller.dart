// Importing necessary dependencies and packages
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentController extends GetxController {
  late Razorpay razorpay;

  //Method to initialize the RazorPay Object
  @override
  void onInit() {
    //TODO: implement onInit
    super.onInit();
    razorpay = Razorpay();

    //Event Listeners
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    //TODO : implement dispose
    super.dispose();
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response)
  {
    String msg = response.orderId!+"\n"+response.paymentId!+"\n"+ response.signature!;
    Get.snackbar('Payment Successful', msg);
  }

  void _handlePaymentError(PaymentFailureResponse response)
  {
    String? msg = response.message;
    Get.snackbar('Payment Error Occured', msg!);
    Fluttertoast.showToast(
        msg: 'Payment Error Occured $msg!'
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response)
  {
    String? msg = response.walletName;
    Get.snackbar('External Wallet Successful', msg!);
  }

  void dispatchPayment(double amount, String name, String contact, String description, String email, String wallet)
  {
    var options = {
        'key': 'rzp_test_ggVr3t5Q7tcK8E',
        'amount': amount,
        'name': name,
        'description': description,
        'prefill': {'contact': contact, 'email': email},
        'external': {
          'wallets' : [wallet]
        }
    };

  try {
    razorpay.open(options);
  }
  catch (e) {
    }
  }


}