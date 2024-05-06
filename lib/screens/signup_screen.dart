
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_plus/controllers/signup_controller.dart';
import 'package:pulse_plus/screens/sign_in_screen.dart';
import 'package:pulse_plus/screens/tab_bar.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _doctorNumberController = TextEditingController();
  final SignupController _signupController = SignupController();

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.only(top:80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/splash.png",
                  width: 250,
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text("Sign up", style: TextStyle(fontSize: 24)),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _nameController,
                        hintText: "Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _ageController,
                        hintText: "Age",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Age';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _doctorNameController,
                        hintText: "Doctor Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Doctor name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _doctorNumberController,
                        hintText: "Doctor Phone Number",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Doctor Phone Number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Have an account?  "),
                          GestureDetector(
                            onTap: () {
                              Get.off(SignInScreen());
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signup(context);
                          }
                        },
                        child: const Text("Continue"),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signup(BuildContext context) {
    Map<String, dynamic> userData = {
      'email': _emailController.text,
      'password': _passwordController.text,
      'name': _nameController.text,
      'age': _ageController.text,
      'doctorName': _doctorNameController.text,
      'doctorPhone': _doctorNumberController.text,
    };

    _signupController.signUpWithFirebase(userData).then((success) {
      if (success) {
        // After successful authentication, navigate to HomeScreen
        Get.off(() =>  TabBarr());
      } else {
        // Show SnackBar with failure reason
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign up failed. Please try again.'),
          ),
        );
      }
    });
  }

}
