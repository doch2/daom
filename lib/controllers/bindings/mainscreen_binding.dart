import 'package:daom/controllers/chat_controller.dart';
import 'package:daom/controllers/community_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:daom/controllers/volunteer_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerController>(() => VolunteerController());
    Get.lazyPut(() => Dio());

    Get.lazyPut<CommunityController>(() => CommunityController());
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
