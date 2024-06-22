import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/get_user_data_model.dart';
import 'token_controller.dart';

class UserController extends GetxController {
  var isLoading = true.obs;

  GetUserData ? getUserData;

  final TokenController tokenController = Get.put(TokenController());

  Future<void> fetchUserData() async {
    isLoading(true);
    tokenController.getToken();
    String userId = tokenController.token!;
    print('Token retrieved: $userId');
    int retryCount = 0;

    while (retryCount < 3) {
      try {
        final response = await http.get(
          Uri.parse('https://demo-pejw.onrender.com/findUser/'),
          headers: {
            'Authorization': 'Bearer $userId',
          },
        );
        print('HTTP request sent');

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          print('Response data: $data');
          if (data['status'] == 'success') {
            getUserData = GetUserData.fromJson(data['data']);
            print('User data: ${getUserData!.data!.predicted![0].heartRate}');
            break; // Exit the loop if successful
          } else {
            Get.snackbar('Error', data['message']);
            print('Error: ${data['message']}');
            break; // Exit the loop on a logical error
          }
        } else {
          Get.snackbar('Error', 'Failed to load user data');
          print('HTTP Error: ${response.statusCode}');
          if (response.statusCode == 502) {
            retryCount++;
            await Future.delayed(Duration(seconds: 2)); // Wait before retrying
            continue; // Retry on 502 error
          } else {
            break; // Exit the loop on other HTTP errors
          }
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
        print('Exception: $e');
        break; // Exit the loop on an exception
      } finally {
        if (retryCount == 3) {
          isLoading(false);
        }
      }
    }
  }
}
