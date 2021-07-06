library home;

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/repository/repository.dart';
import 'package:getx_tracking/resource/app_pages.dart';
import 'package:getx_tracking/resource/resource.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../module.dart';

part './home_controller.dart';
part './home_screen.dart';

Widget get createHome => _HomeScreen();

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<_HomeController>(_HomeController());
  }
}
