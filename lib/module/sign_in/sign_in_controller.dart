part of sign_in;

class _SignInController extends BaseController {
  final TextEditingController usernameController = TextEditingController(text: '123');
  final TextEditingController pwdController = TextEditingController(text: '123');

  String get username => usernameController.text;
  String get password => pwdController.text;

  void onSignIn() {
    print('$username - $password');
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    pwdController.dispose();
  }
}
