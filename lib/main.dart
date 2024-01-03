import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_api_calling/dummydataui/dummy_header_page.dart';
import 'package:flutter_api_calling/productui/product_page.dart';
import 'package:flutter_api_calling/ui_helper/util.dart';
import 'package:flutter_api_calling/userdataui/user_data_page.dart';
import 'package:get/get.dart';
import 'albumui/album_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Api Calling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.pink_color),
        useMaterial3: true,
      ),
      home: MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pink_color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter Api Calling',
              style: mTextStyle20(),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.pink_color,
        title: Text('Flutter Api Calling', style: mTextStyle20()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: [
            Column(children: [
              Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.all(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.pink_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return UserDataPage();
                      }),
                    );
                  },
                  child: Text(
                    'Api Calling User Data',
                    style: mTextStyle20(),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.all(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.pink_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DummyHeaderPage();
                      }),
                    );
                  },
                  child: Text(
                    'Api Calling User Data With Headers',
                    style: mTextStyle20(),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.all(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.pink_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ProductPage();
                      }),
                    );
                  },
                  child: Text(
                    'Api Calling Product',
                    style: mTextStyle20(),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.all(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.pink_color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return AlbumPage();
                      }),
                    );
                  },
                  child: Text(
                    'Api Calling Album Page',
                    style: mTextStyle20(),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
