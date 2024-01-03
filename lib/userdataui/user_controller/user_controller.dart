import 'dart:convert';

import 'package:flutter_api_calling/userdataui/user_model/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isLoading = false.obs;
  UserModel? userModel;

  fetchUserData() async {
    try {
      isLoading(true);
      http.Response response =
          await http.get(Uri.tryParse('https://reqres.in/api/users')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        userModel = UserModel.fromJson(result);
      } else {
        print('error');
      }
    } catch (e) {
      print("Error while fetching data $e");
    } finally {
      isLoading(false);
    }
  }
}
