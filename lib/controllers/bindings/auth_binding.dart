import 'package:get/get.dart';

import 'package:daom/controllers/auth_controller.dart';

import 'package:daom/controllers/user_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
