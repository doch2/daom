import 'package:daom/controllers/community_controller.dart';
import 'package:daom/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePost extends GetWidget<CommunityController> {
  WritePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    final titleTextController = TextEditingController();
    final contentTextController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Write Post Page"),
            SizedBox(height: _height * 0.1),
            SizedBox(
              width: _width * 0.5,
              child: TextField(
                  controller: titleTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '제목',
                  ),
                  style: writePostTitle
              ),
            ),
            SizedBox(
              width: _width * 0.8,
              child: TextField(
                controller: contentTextController,
                keyboardType: TextInputType.multiline,
                minLines: null,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: '내용',
                ),
                style: writePostContent,
              ),
            ),
            SizedBox(height: _height * 0.05),
            GestureDetector(
              onTap: () => controller.pickImage(),
              child: Container(
                height: _height * 0.055,
                width: _width * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF2c2c2c).withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 10,
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "사진 올리기",
                        style: TextStyle(
                            fontSize: 15, fontFamily: 'NotoSansKR', fontWeight: FontWeight.w900)
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: _height * 0.1),
            GestureDetector(
              onTap: () => controller.writeNewPost(titleTextController.text, contentTextController.text),
              child: Container(
                height: _height * 0.075,
                width: _width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF2c2c2c).withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 10,
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "글 업로드하기",
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'NotoSansKR', fontWeight: FontWeight.w900)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}