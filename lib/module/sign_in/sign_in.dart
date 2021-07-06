library sign_in;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/module/module.dart';

part './sign_in_controller.dart';
part './sign_in_screen.dart';

Widget get createSignIn => _SignInScreen();

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<_SignInController>(_SignInController());
  }
}
