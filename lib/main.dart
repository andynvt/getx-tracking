import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/repository/repository.dart';
import 'package:getx_tracking/resource/resource.dart';
import 'package:getx_tracking/service/services.dart';
import 'module/module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();
  await UserRepository.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: AppPages.pages,
      initialRoute: Routes.SPLASH,
      initialBinding: SplashBinding(),
      home: createSplash,
      builder: EasyLoading.init(),
    ),
  );
}
