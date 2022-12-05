import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/db_service.dart';
import 'package:flutter/material.dart';
import 'app/services/api_service.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<DataBaseService>(
    () => DataBaseService(),

    /// This property will call disposed instances.
    fenix: true,
  );

  Get.lazyPut<ApiService>(
    () => ApiService(),

    /// This property will call disposed instances.
    fenix: true,
  );
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(
    GetMaterialApp(
      title: "Quotes",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
