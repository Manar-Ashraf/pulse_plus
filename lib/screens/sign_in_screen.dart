import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_plus/controllers/signin_controller.dart';
import 'package:pulse_plus/screens/signup_screen.dart';
import 'package:pulse_plus/screens/tab_bar.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInController _signInController = SignInController();

  @override
  Widget build(BuildContext context) {
    // Check if the user is already signed in
    if (FirebaseAuth.instance.currentUser != null) {
      // Navigate to the TabBar screen if the user is already signed in
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Get.off(() => TabBarr());
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.only(top:160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/splash.png",
                  width: 250,
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text("Sign In",
                          style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
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
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account yet?  "),
                          GestureDetector(
                            onTap: () {
                              Get.off(SignupScreen());
                            },
                            child: const Text(
                              "Sign Up",
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            final success = await _signInController.signInWithEmailPassword(email, password);
                            if (success) {
                              if (_signInController.currentUser != null) {
                                Get.off(() =>  TabBarr());
                              } else {
                                // Show a snackbar if user is null
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Email doesn\'t exist. You have to sign up first.'),
                                  ),
                                );
                              }
                            } else {
                              // Show a snackbar if sign in fails
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Sign in failed. Please try again.'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text("Continue"),
                      ),
                      const SizedBox(
                        height: 40,
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
}
