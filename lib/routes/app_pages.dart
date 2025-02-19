import 'package:get/get.dart';

import 'package:wonderful_app/routes/app_routes.dart';
import 'package:wonderful_app/screens/screens.dart';

/// GetX Generator - fb.com/htngu.99

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.SCREEN1, page: () => const Screen1()),
    GetPage(name: Routes.SCREEN2, page: () => const Screen2()),
    GetPage(name: Routes.SCREEN3, page: () => Screen3()),
  ];
}
