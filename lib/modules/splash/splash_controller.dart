part of splash;

class _SplashController extends BaseController {
  @override
  void onReady() {
    super.onReady();
    checkLogin();
  }

  void checkLogin() {
    if (cacheSrv.accessToken.isEmpty) {
      Get.toNamed(Routes.SIGN_IN);
    } else {
      Get.toNamed(Routes.HOME);
    }
  }
}
