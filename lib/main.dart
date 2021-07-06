import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/res/res.dart';
import 'package:getx_tracking/services/cache/cache_service.dart';

import 'modules/modules.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();

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
