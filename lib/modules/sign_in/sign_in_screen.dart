part of sign_in;

class _SignInScreen extends GetView<_SignInController> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              controller: controller.usernameController,
            ),
            TextField(
              controller: controller.pwdController,
              obscureText: true,
            ),
            MaterialButton(
              onPressed: controller.onSignIn,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
