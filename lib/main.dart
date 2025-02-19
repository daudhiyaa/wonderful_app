import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonderful_app/controller/user_controller.dart';
import 'package:wonderful_app/routes/app_pages.dart';
import 'package:wonderful_app/routes/app_routes.dart';
import 'package:wonderful_app/themes/fonts.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(initialRoute: Routes.SCREEN1));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.pages,
    );
  }
}
