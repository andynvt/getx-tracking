part of sign_in;

class SignInScreen extends GetView<SignInController> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GetX<SignInController>(
          builder: (_) {
            return Text(_.counter.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increase,
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
