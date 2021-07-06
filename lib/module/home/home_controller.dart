part of home;

class _HomeController extends BaseController {
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  LatLng position = Const.defaultPosition;

  late GoogleMapController controller;
  Marker? marker;
  Circle? circle;

  @override
  void onInit() async {
    //test
    final imageData = await _getMakers();
    final l = LocationData.fromMap(Const.dataMap); //fake
    _updateMarkers(l, imageData);
    update();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    if (_locationData == null) {
      position = Const.defaultPosition;
    } else {
      position = LatLng(
        _locationData!.latitude ?? Const.defaultPosition.longitude,
        _locationData!.longitude ?? Const.defaultPosition.longitude,
      );
    }
    super.onInit();
  }

  void onSignOut() {
    easyLoading(true);
    userRepo.signOut((isOK, e) {
      easyLoading(false);
      if (!isOK) {
        Get.showSnackbar(
          GetBar(
            message: e,
            isDismissible: true,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        Get.offAllNamed(Routes.SIGN_IN);
      }
    });
  }

  void onStartMoving() async {
    final imageData = await _getMakers();
    // final l1 = await location.getLocation(); //current
    final l = LocationData.fromMap(Const.dataMap); //fake
    _updateMarkers(l, imageData);
    update();
  }

  void _updateMarkers(LocationData newLocation, Uint8List imageData) {
    final p = LatLng(newLocation.latitude ?? 0, newLocation.longitude ?? 0);
    marker = Marker(
      markerId: MarkerId('car'),
      position: p,
      rotation: newLocation.heading ?? 0,
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: Offset(0.5, 0.5),
      icon: BitmapDescriptor.fromBytes(imageData),
    );
    circle = Circle(
      circleId: CircleId('circle'),
      radius: newLocation.accuracy ?? 0,
      zIndex: 1,
      strokeColor: Colors.blue,
      strokeWidth: 5,
      center: p,
      fillColor: Colors.blue.withAlpha(70),
    );
  }

  Future<Uint8List> _getMakers() async {
    final b = await rootBundle.load(Id.car);
    return b.buffer.asUint8List();
  }
}
