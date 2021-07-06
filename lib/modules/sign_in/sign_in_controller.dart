part of sign_in;

class SignInController extends BaseController {
  RxInt counter = 0.obs;

  void increase() {
    counter++;
    Get.to(Home());
  }
}
