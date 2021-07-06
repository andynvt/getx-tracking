// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:get/get.dart';

// class BaseScreen<T> extends GetView<T> with ResponsiveWidget {
//   const BaseScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return buildUi(context: context);
//   }

//   @override
//   Widget buildDesktop(BuildContext context) {
//     return const SizedBox();
//   }

//   @override
//   Widget buildMobile(BuildContext context) {
//     return const SizedBox();
//   }

//   @override
//   Widget buildTablet(BuildContext context) {
//     return const SizedBox();
//   }
// }

// abstract class ResponsiveWidget {
//   Widget buildDesktop(BuildContext context);

//   Widget buildTablet(BuildContext context);

//   Widget buildMobile(BuildContext context);

//   Widget buildUi({required BuildContext context}) {
//     return ResponsiveBuilder(builder: (context, sizeInfo) {
//       if (sizeInfo.deviceScreenType == DeviceScreenType.desktop) {
//         return buildDesktop(context);
//       } else if (sizeInfo.deviceScreenType == DeviceScreenType.tablet) {
//         return buildTablet(context);
//       } else if (sizeInfo.deviceScreenType == DeviceScreenType.mobile) {
//         return buildMobile(context);
//       }
//       return const SizedBox();
//     });
//   }
// }
