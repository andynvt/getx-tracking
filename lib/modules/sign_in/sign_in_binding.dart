library sign_in;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/modules/home/home_screen.dart';
import 'package:getx_tracking/modules/modules.dart';

part './sign_in_controller.dart';
part './sign_in_screen.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
  }
}
