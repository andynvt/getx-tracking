part of sign_in;

class _SignInScreen extends GetView<_SignInController> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GetX<_SignInController>(
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
