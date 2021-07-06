part of home;

class _HomeController extends BaseController {
  void onSignOut() {
    easyLoading(true);
    userRepo.signOut((isOK, e) {
      easyLoading(false);
      if (!isOK) {
        Get.showSnackbar(
          GetBar(
            message: e,
            isDismissible: true,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        Get.offAllNamed(Routes.SIGN_IN);
      }
    });
  }
}
