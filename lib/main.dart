import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/res/res.dart';

import 'modules/modules.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: SignInBinding(),
    initialRoute: Routes.SIGN_IN,
    defaultTransition: Transition.native,
    getPages: AppPages.pages,
    home: SignInScreen(),
  ));
}
