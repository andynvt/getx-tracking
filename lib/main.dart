import 'package:flutter/material.dart';
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
      initialRoute: Routes.SIGN_IN,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.pages,
      initialBinding: SplashBinding(),
      home: createSplash,
    ),
  );
}
