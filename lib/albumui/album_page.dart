import 'package:flutter/material.dart';
import 'package:flutter_api_calling/albumui/album_controller/album_controller.dart';
import 'package:flutter_api_calling/ui_helper/util.dart';
import 'package:get/get.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  AlbumController albumController = Get.put(AlbumController());

  @override
  void initState() {
    super.initState();
    albumController.fetchAlbumData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar(context, "Album Page"),
      body: Obx(
        () {
          if (albumController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (albumController.albumsList != null) {
            return ListView.builder(
              itemCount: albumController.albumsList!.length,
              itemBuilder: (context, index) {
                var album = albumController.albumsList![index];
                return ListTile(
                  title: Text(album.title ?? '',
                      style:
                          mTextStyle16().copyWith(color: AppColor.pink_color)),
                  subtitle: Text(
                      'User ID: ${album.userId ?? ''}, Album ID: ${album.id ?? ''}',
                      style: mTextStyle16().copyWith(color: Colors.black)),
                );
              },
            );
          } else {
            return Center(child: Text('Error loading data'));
          }
        },
      ),
    );
  }
}
