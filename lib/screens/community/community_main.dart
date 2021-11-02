import 'package:daom/controllers/community_controller.dart';
import 'package:daom/screens/community/write_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CommunityMain extends GetWidget<CommunityController> {
  CommunityMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    Permission.storage.request();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Community Page"),
            SizedBox(height: _height * 0.1),
            GestureDetector(
              onTap: () => Get.to(WritePost()),
              child: Text("글쓰기 화면으로 가기"),
            ),
          ],
        ),
      ),
    );
  }
}