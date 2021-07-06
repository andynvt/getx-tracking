part of sign_in;

class _SignInController extends BaseController {
  RxInt counter = 0.obs;

  void increase() {
    counter++;
    Get.to(Routes.HOME);
  }
}
