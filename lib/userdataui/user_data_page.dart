import 'package:flutter/material.dart';
import 'package:flutter_api_calling/ui_helper/util.dart';
import 'package:flutter_api_calling/userdataui/details_page.dart';
import 'package:flutter_api_calling/userdataui/user_controller/user_controller.dart';
import 'package:get/get.dart';

class UserDataPage extends StatefulWidget {
  UserDataPage({super.key});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  UserController userController = Get.put(UserController());

  initState() {
    super.initState();
    userController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar(context, "User Data Page"),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Obx(
          () => userController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: userController.userModel?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(
                            'First Name: ${userController.userModel?.data?[index].firstName} ${userController.userModel?.data?[index].lastName}');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailsPage(
                              firstname:
                                  '${userController.userModel?.data?[index].firstName} ${userController.userModel?.data?[index].lastName}',
                              avatar:
                                  "${userController.userModel?.data?[index].avatar}",
                              heroTag:
                                  'avatar_${userController.userModel?.data?[index].id}');
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.pink_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(6),
                        child: Row(
                          children: [
                            Hero(
                              tag:
                                  'avatar_${userController.userModel?.data?[index].id}',
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  userController
                                          .userModel?.data?[index].avatar ??
                                      '',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                                'Name: ${userController.userModel?.data?[index].firstName} ${userController.userModel?.data?[index].lastName}',
                                style: mTextStyle20()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
