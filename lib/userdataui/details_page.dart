import 'package:flutter/material.dart';
import 'package:flutter_api_calling/ui_helper/util.dart';

class DetailsPage extends StatelessWidget {
  final String firstname;
  final String avatar;
  final String heroTag;

  DetailsPage(
      {required this.firstname, required this.avatar, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar(context, "User Details Page"),
      body: ListView(
        children: [
          Column(
            children: [
              Hero(
                tag: heroTag,
                child: Image.network(
                  "$avatar",
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name: $firstname',
                style: mTextStyle20().copyWith(color: Colors.pink),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
