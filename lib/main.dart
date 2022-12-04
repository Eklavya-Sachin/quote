import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'app/services/api_service.dart';

void main() {
  Get.lazyPut<ApiService>(
    () => ApiService(),

    /// This property will call disposed instances.
    fenix: true,
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
