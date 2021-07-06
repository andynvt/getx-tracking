import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var loading = false.obs;

  setLoading(bool status) {
    if (status) {
      loading.value = true;
    } else {
      loading.value = false;
    }
  }

  easyLoading(bool status) {
    if (status) {
      if (!EasyLoading.isShow) EasyLoading.show();
    } else if (EasyLoading.isShow) EasyLoading.dismiss();
  }
}
