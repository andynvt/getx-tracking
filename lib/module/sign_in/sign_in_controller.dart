part of sign_in;

class _SignInController extends BaseController {
  final TextEditingController usernameController = TextEditingController(text: '123456@mail.com');
  final TextEditingController pwdController = TextEditingController(text: '123456');

  String get email => usernameController.text;
  String get password => pwdController.text;

  void onSignIn() {
    print('$email - $password');
    easyLoading(true);
    userRepo.signIn(
      email: email,
      password: password,
      callback: (isOK, e) {
        easyLoading(false);
        if (isOK) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.showSnackbar(
            GetBar(
              message: e,
              isDismissible: true,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    pwdController.dispose();
  }
}
