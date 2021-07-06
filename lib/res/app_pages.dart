import 'package:get/get.dart';
import 'package:getx_tracking/modules/modules.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(name: Routes.SIGN_IN, page: () => SignInScreen()),
  ];
}
