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
          Get.dialog(
            Center(
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(32),
                padding: const EdgeInsets.all(16),
                child: Text(e ?? ''),
              ),
            ),
            barrierDismissible: true,
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
