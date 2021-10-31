import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:daom/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut(() => Dio());
  }
}
