import 'package:flutter/material.dart';

import 'package:daom/services/firebase_storage_service.dart';
import 'package:daom/services/firestore_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class CommunityController extends GetxController {
  XFile? postImage;

  writeNewPost(String title, String content) async {
    try {
      String postID = randomAlphaNumeric(25);
      int photoAmount = 0;

      if (postImage != null) {
        await FirebaseStorageService().uploadNewImage("posts/$postID/1", postImage!);

        postImage = null;
        photoAmount = 1;
      }

      await FirestoreDatabase().writeNewPost(title, content, photoAmount, postID);

      Fluttertoast.showToast(
          msg: "게시글 등록에 성공했습니다!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xE6FFFFFF),
          textColor: Colors.black,
          fontSize: 13.0
      );
      Get.back();
    } catch(e) {
      Fluttertoast.showToast(
          msg: "게시글 등록에 실패했습니다.\n인터넷 연결 또는 계정 상태를 확인 후 \n다시 시도해 주세요.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xE6FFFFFF),
          textColor: Colors.black,
          fontSize: 13.0
      );
    }
  }
  
  pickImage() async{
    postImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  }


}
