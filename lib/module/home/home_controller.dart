part of home;

class _HomeController extends BaseController {
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  late GoogleMapController controller;

  @override
  void onInit() async {
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
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
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
}
