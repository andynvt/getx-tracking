import 'package:get/get.dart';
import 'package:getx_tracking/modules/modules.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => createSplash, binding: SplashBinding()),
    GetPage(name: Routes.SIGN_IN, page: () => createSignIn, binding: SignInBinding()),
    GetPage(name: Routes.HOME, page: () => createHome, binding: HomeBinding()),
  ];
}
