import 'dart:convert';

import 'package:flutter_api_calling/dummydataui/dummy_model/dummy_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DummyController extends GetxController {
  var isLoading = false.obs;
  DummyModel? dummyModel;

  fetchDummyData() async {
    try {
      isLoading(true);
      http.Response response = await http
          .get(Uri.tryParse('http://dummyapi.io/data/v1/user')!, headers: {
        'app-id': '6218809df11d1d412af5bac4',
      });
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        dummyModel = DummyModel.fromJson(result);
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
