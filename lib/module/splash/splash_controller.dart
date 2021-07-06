part of splash;

class _SplashController extends BaseController {
  @override
  void onReady() {
    super.onReady();
    checkLogin();
  }

  void checkLogin() async {
    easyLoading(true);
    await Future.delayed(Duration(seconds: 1));
    easyLoading(false);
    if (cacheSrv.accessToken.isEmpty) {
      // Get.toNamed(Routes.SIGN_IN);
      Get.offAllNamed(Routes.SIGN_IN);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
