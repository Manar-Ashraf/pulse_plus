import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/get_user_data_model.dart';
import 'token_controller.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  GetUserData? getUserData;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  final TokenController tokenController = Get.put(TokenController());

  Future<void> fetchUserData() async {
    isLoading(true);
    await tokenController.getToken();
    String userId = tokenController.token!;
    tokenController.getTok();
    // print(userId);
    // print('Token retrieved: $userId');
    // int retryCount = 0;

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
          print(data);
          isLoading.value=false;

          if (data['status'] == 'success') {
            getUserData = GetUserData.fromJson(data);
            if (getUserData?.data != null) {
              print('User data: ${getUserData?.data?.predicted?.first.heartRate}');
            } else {
              print('Data is null');
            }// Exit the loop if successful
          } else {
            Get.snackbar('Error', data['message']);
            print('Error: ${data['message']}');
            isLoading.value=true;
             // Exit the loop on a logical error
          }
        } else {
          Get.snackbar('Error', 'Failed to load user data');
          print('HTTP Error: ${response.statusCode}');
          isLoading.value=true;
          if (response.statusCode == 502) {
            await Future.delayed(Duration(seconds: 2)); // Wait before retrying
             // Retry on 502 error
          } else {
             // Exit the loop on other HTTP errors
          }
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
        print('Exception: $e');
         // Exit the loop on an exception
      }
  }
}
