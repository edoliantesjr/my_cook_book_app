import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_recipe_app/app/app.router.dart';

import 'app/app.locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setupLocator();
  runApp(GetMaterialApp(
    navigatorKey: Get.key,
    title: 'My CookBook App',
    debugShowCheckedModeBanner: false,
    onGenerateRoute: StackedRouter().onGenerateRoute,
    initialRoute: Routes.SplashView,
    theme: ThemeData(
      textTheme: TextTheme(
        bodyText2: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ),
  ));
}
