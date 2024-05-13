import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pulse_plus/controllers/token_controller.dart';

TokenController tokenController = Get.put(TokenController());

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpWithFirebase(Map<String, dynamic> userData) async {
    try {
      final String email = userData['email'];
      final String password = userData['password'];

      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Remove password from user data before sending to API
      userData.remove('password');

      if (userCredential.user != null) {
        print('User created successfully: ${userCredential.user!.email}');
        final bool apiSuccess = await _sendAdditionalDataToAPI(userData);

        return apiSuccess; // Sign up successful
      } else {
        print('User creation failed');
        return false; // Sign up failed
      }
    } catch (e) {
      print('Error signing up with Firebase: $e');
      return false; // Sign up failed
    }
  }

  Future<bool> _sendAdditionalDataToAPI(Map<String, dynamic> userData) async {
    try {
      final String apiUrl = 'https://demo-pejw.onrender.com/signup';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Auth':'${tokenController.getToken()}'
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        print('Data sent to API successfully');
        print (response);

        return true; // API call successful
      } else {
        print('Failed to send data to API. Status code: ${response.statusCode}');
        return false; // API call failed
      }
    } catch (e) {
      print('Error sending data to API: $e');
      return false; // API call failed
    }
  }
}
