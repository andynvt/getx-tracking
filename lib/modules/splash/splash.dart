library splash;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/modules/base/base_controller.dart';
import 'package:getx_tracking/res/app_pages.dart';
import 'package:getx_tracking/services/cache/cache_service.dart';

part './splash_controller.dart';
part './splash_screen.dart';

Widget get createSplash => _SplashScreen();

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<_SplashController>(_SplashController());
  }
}
