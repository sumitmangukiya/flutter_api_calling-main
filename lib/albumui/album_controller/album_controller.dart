import 'package:flutter_api_calling/albumui/album_model/album_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlbumController extends GetxController {
  var isLoading = false.obs;
  List<AlbumsModel>? albumsList;

  fetchAlbumData() async {
    try {
      isLoading(true);
      http.Response response =
      await http.get(Uri.tryParse('https://jsonplaceholder.typicode.com/albums')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body) as List;
        albumsList = result.map((json) => AlbumsModel.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error while fetching data $e");
    } finally {
      isLoading(false);
    }
  }
}
