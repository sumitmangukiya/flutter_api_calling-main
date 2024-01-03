import 'package:flutter_api_calling/productui/product_model/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends GetxController {
  var isLoading = false.obs;
  ProductModel? productModel;

  fetchProductData() async {
    try {
      isLoading(true);
      http.Response response =
          await http.get(Uri.parse('https://dummyjson.com/products')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        productModel = ProductModel.fromJson(result);
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
