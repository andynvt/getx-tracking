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
      body: GetBuilder<_HomeController>(builder: (_) {
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _.position,
            zoom: Const.defaultZoom,
          ),
          circles: Set.of(_.circle != null ? [_.circle!] : []),
          markers: Set.of(_.marker != null ? [_.marker!] : []),
          onMapCreated: (c) {
            controller.controller = c;
          },
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: FloatingActionButton(
          onPressed: controller.onStartMoving,
          child: Icon(
            Icons.run_circle_outlined,
            size: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
