part of home;

class _HomeScreen extends GetView<_HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: controller.onSignOut,
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
