// Importing necessary dependencies and packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controllers/auth_controller.dart';

// Importing the SignUpScreen widget
import 'package:app/views/sign_up_screen.dart';

// This class represents the LoginScreen widget, which is a StatefulWidget.
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// This class represents the state of the LoginScreen widget.
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> userLoginData = {"ward_no": "", "tap_rr_no":"","email": "", "password": ""};

  // Find the instance of AuthController
  AuthController controller = Get.put(AuthController());

  // Function to handle login
  login() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('Data for login $userLoginData');

      // Call the login function in the AuthController
      controller.login(userLoginData["ward_no"], userLoginData["tap_rr_no"], userLoginData["email"], userLoginData["password"]);

      print('Data for login2 $userLoginData');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Building the UI for the LoginScreen widget
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Screen'),
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
                      'assets/Login.png',
                      height: 300.0,
                      width: 300.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                      userLoginData["email"] = value!;
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
                      userLoginData["password"] = value!;
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Ward No.',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ward No. Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userLoginData["ward_no"] = value!;
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Tap No./RRR No.',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userLoginData["tap_rr_no"] = value!;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: login,
                    child:
                    Text('Login Now'),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        //Routing to SignUp Page
                        Get.to(() => SignUpScreen());

                      },
                      child: Text(
                        "Don't Have an Account ? Sign up",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
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

/*
* Overall, this code imports necessary dependencies and packages.
* It includes the AuthController for managing authentication.
* The code defines the LoginScreen widget and its state, which allows users to log in with their email, password, ward number, and tap number/RRR number. It validates the input fields and calls the login function in the AuthController to handle the login.
* The UI is built using a Card, Form, and various form fields, including text input fields and an elevated button for login.
* It also includes a link to navigate to the SignUpScreen.
*/