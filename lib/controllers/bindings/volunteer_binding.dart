import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:daom/controllers/volunteer_controller.dart';

class VolunteerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolunteerController>(() => VolunteerController());
    Get.lazyPut(() => Dio());
  }
}
