import 'package:flutter/material.dart';
import 'package:flutter_api_calling/dummydataui/dummy_controller/dummy_controller.dart';
import 'package:flutter_api_calling/ui_helper/util.dart';
import 'package:get/get.dart';

class DummyHeaderPage extends StatefulWidget {
  const DummyHeaderPage({super.key});

  @override
  State<DummyHeaderPage> createState() => _DummyHeaderPageState();
}

class _DummyHeaderPageState extends State<DummyHeaderPage> {
  DummyController dummyController = Get.put(DummyController());

  @override
  void initState() {
    super.initState();
    dummyController.fetchDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar(context, "Dummy Header Page"),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Obx(
          () => dummyController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: dummyController.dummyModel?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColor.pink_color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(6),
                      padding: EdgeInsets.all(6),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              dummyController
                                      .dummyModel?.data?[index].picture ??
                                  '',
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: Text(
                              'Name: ${dummyController.dummyModel?.data?[index].firstName} ${dummyController.dummyModel?.data?[index].lastName}',
                              style: mTextStyle20(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
