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
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(45.521563, -122.677433),
          zoom: 14.4746,
        ),
        onMapCreated: (c) {
          controller.controller = c;
        },
      ),
    );
  }
}
