import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:task_management/screen/splash_page.dart';
import 'package:task_management/utls/colors.dart';

// import 'model_class/pagelist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kBackground // status bar color
        ));

    return GetMaterialApp(
      // checkerboardOffscreenLayers: true,
      // checkerboardRasterCacheImages: false,
      // highContrastDarkTheme: true,
      // showPerformanceOverlay: true,
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kBackground,
      useMaterial3: false
      ),
      home: const SplashPage(),
    );
  }
}
