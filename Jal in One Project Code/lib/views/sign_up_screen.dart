// Importing necessary dependencies and packages
import 'package:app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This class represents the SignUpScreen widget, which is a StatefulWidget.
class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

// This class represents the state of the SignUpScreen widget.
class _SignUpScreenState extends State<SignUpScreen> {
  // A GlobalKey that uniquely identifies the Form widget in the tree.
  final _formKey = GlobalKey<FormState>();

  // A map to store the user signup data.
  Map<String, String> userSignupData = {
    "ward_no": "",
    "tap_rr_no":"",
    "email": "",
    "password": ""
  };

  // Finding the instance of the AuthController using Get.find()
  AuthController controller = Get.find();

  // Method for signing up the user
  signUp() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('User Sign Up Data $userSignupData');
      controller.signUp(userSignupData['ward_no'], userSignupData['tap_rr_no'], userSignupData['email'], userSignupData['password']);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the UI for the SignUpScreen widget
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up Screen'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      'assets/Signup.png',
                      height: 300.0,
                      width: 300.0,
                    ),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['email'] = value!;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['password'] = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: signUp,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
